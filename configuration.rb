# encoding: UTF-8
require 'fileutils'
load 'style_specific/default_osm_style.rb' #TODO - stop hardcoding this

module CartoCSSHelper::Configuration
	def get_max_z
		return 22
	end

	def get_min_z
		return 4
	end

  def set_style_path(path)
    @style_path = path
  end

	def get_style_path
		return @style_path
	end

	def get_path_to_folder_for_output
		location = File.join(File.dirname(__FILE__), 'output', '')
		FileUtils::mkdir_p location
		return location
	end

	def get_path_to_folder_for_cache
    location = File.join(File.dirname(__FILE__), 'cache', '')
		FileUtils::mkdir_p location
		return location
	end

	def get_path_to_folder_for_branch_specific_cache
		location = File.join(get_path_to_folder_for_cache, $commit, '')
		FileUtils::mkdir_p location
		return location
	end

	def get_path_to_folder_for_overpass_cache
		location = File.join(get_path_to_folder_for_cache, 'overpass', '')
		FileUtils::mkdir_p location
		return location
	end

	def get_data_filename
		return get_path_to_folder_for_branch_specific_cache+'data.osm'
	end
end