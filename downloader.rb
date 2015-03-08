# encoding: UTF-8
require 'rest-client'
require 'digest/sha1'


module CartoCSSHelper
  class Downloader
    def self.download_osm_data_for_location(latitude, longitude, size, accept_cache=true)
      filename = get_path_to_folder_for_cache + "#{latitude} #{longitude} #{size}.osm"
      if File.exists?(filename)
        if accept_cache
          return filename
        end
        File.delete(filename)
      end
      query = get_query_to_download_data_around_location(latitude, longitude, size)
      text = get_overpass_query_results(query)
      file = File.new(filename, 'w')
      file.write text
      file.close
      return filename
    end

    def self.get_query_to_download_data_around_location(latitude, longitude, size)
      min_latitude = latitude - size/2
      max_latitude = latitude + size/2
      min_longitude = longitude - size/2
      max_longitude = longitude + size/2
      bb = "#{min_latitude},#{min_longitude},#{max_latitude},#{max_longitude}"
      query = '[timeout:3600];'
      query += "\n"
      query += "(node(#{bb});<;);"
      query += "\n"
      query += 'out meta;'
      query += "\n"
      query += '/*'
      query += "\nbbox size: #{size}"
      query += "\nhttp://www.openstreetmap.org/#map=17/#{latitude}/#{longitude}"
      query += "\n"
      query += '*/'
      query += "\n"
      return query
    end

    def self.locate_element_with_given_tags(tags, latitude, longitude)
      #special support for following tag values:  :any_value
      range = 10*1000
      loop do
        list = Downloader.get_overpass_query_results(Downloader.get_query_to_get_location(tags, latitude, longitude, range))
        if list.length != 0
          list = list.match(/((|-)[\d\.]+)\s+((|-)[\d\.]+)/).to_a
          lat = Float(list[1])
          lon = Float(list[3])
          return lat, lon
        end
        range=range+[range, 100000].min
      end
    end

    def self.get_query_to_get_location(tags, latitude, longitude, range)
      #special support for following tag values:  :any_value
      locator = '[timeout:3600][out:csv(::lat,::lon;false)];'
      locator += "\n"
      locator += Downloader.get_query_element_to_get_location(tags, latitude, longitude, 'way', range)
      locator +='out center;'
      locator += "\n"
      locator += Downloader.get_query_element_to_get_location(tags, latitude, longitude, 'node', range/10)
      locator +='out center;'
      locator += "\n"
      locator += '/*'
      locator += "\nrange: #{range/1000}km"
      locator += "\nhttp://www.openstreetmap.org/#map=17/#{latitude}/#{longitude}"
      locator += "\n"
      locator += '*/'
      locator += "\n"
      return locator
    end

    def self.get_query_element_to_get_location(tags, latitude, longitude, type, range)
      #special support for following tag values:  :any_value
      #TODO - escape value with quotation signs in them
      element="(#{type}"
      element += "\n"
      tags.each {|tag|
        if tag[1] == :any_value
          element+="\t['#{tag[0]}']"
        else
          element+="\t['#{tag[0]}'='#{tag[1]}']"
        end
        element += "\n"
      }
      element+="\t(around:#{range},#{latitude},#{longitude});"
      element += "\n"
      element+=');'
      element += "\n"
      return element
    end

    def self.get_overpass_query_results(query, debug=false)
      # noinspection RubyResolve
      hash = Digest::SHA1.hexdigest query
      query_cache_filename = get_path_to_folder_for_overpass_cache + hash + '_query.cache'
      if File.exists?(query_cache_filename)
        file = File.new(query_cache_filename)
        cached = file.read
        file.close
        return cached
      end
      if debug
        puts query
        puts
      end
      cached = Downloader.run_overpass_query query
      file = File.new(query_cache_filename, 'w')
      file.write cached
      file.close
      return cached
    end

    def self.run_overpass_query(query, retry_count=0, retry_max=5)
      #default timeout is set to 180: http://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#timeout
      #[timeout:3600]; should be used in all queries executed here
      start = Time.now.to_s
      begin
        return RestClient::Request.execute(:method => :get, :url => Downloader.format_query_into_url(query), :timeout => 3600)
      rescue RestClient::RequestFailed => e
        puts query
        puts e.response
        puts e.http_code
        puts start
        puts Time.now.to_s
        if retry_count < retry_max
          sleep 60*5
          Downloader.run_overpass_query(query, retry_count+1, retry_max)
        else
          e.raise
        end
      end
    end

    def self.format_query_into_url(query)
      query = query.gsub(/\n/, '')
      query = query.gsub(/\t/, '')
      return 'http://overpass-api.de/api/interpreter?data=' + URI.escape(query)
    end
  end
end