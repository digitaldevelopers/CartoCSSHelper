require_relative('style_specific')

module CartoCSSHelper
  module StyleDataForDefaultOSM
    def self.get_style_data
      min_z = 4
      max_z = 22
      return CartoCSSHelper::StyleSpecificData.new(min_z, max_z, get_expected_tag_status, get_composite_sets)
    end

    def self.get_expected_tag_status
        return [
            TagRenderingStatus.new('access', '*', :composite, {'amenity'=>'parking'}),
            TagRenderingStatus.new('access', 'destination', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('access', 'no', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('access', 'private', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('addr:housename', '*', :primary),
            TagRenderingStatus.new('addr:housenumber', '*', :primary),
            TagRenderingStatus.new('addr:interpolation', '*', :primary),
            TagRenderingStatus.new('admin_level', '10', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '2', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '3', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '4', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '5', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '6', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '7', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '8', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('admin_level', '9', :composite, {'boundary'=>'administrative'}),
            TagRenderingStatus.new('aerialway', 'cable_car', :primary),
            TagRenderingStatus.new('aerialway', 'chair_lift', :primary),
            TagRenderingStatus.new('aerialway', 'drag_lift', :primary),
            TagRenderingStatus.new('aerialway', 'gondola', :primary),
            TagRenderingStatus.new('aerialway', 'goods', :primary),
            TagRenderingStatus.new('aerialway', 'platter', :primary),
            TagRenderingStatus.new('aerialway', 'rope_tow', :primary),
            TagRenderingStatus.new('aerialway', 'station', :primary),
            TagRenderingStatus.new('aeroway', 'aerodrome', :primary),
            TagRenderingStatus.new('aeroway', 'apron', :primary),
            TagRenderingStatus.new('aeroway', 'gate', :composite, {'ref'=>'3'}),
            TagRenderingStatus.new('aeroway', 'helipad', :primary),
            TagRenderingStatus.new('aeroway', 'runway', :primary),
            TagRenderingStatus.new('aeroway', 'taxiway', :primary),
            TagRenderingStatus.new('aeroway', 'terminal', :primary),
            TagRenderingStatus.new('amenity', 'atm', :primary),
            TagRenderingStatus.new('amenity', 'bank', :primary),
            TagRenderingStatus.new('amenity', 'bar', :primary),
            TagRenderingStatus.new('amenity', 'bench', :primary),
            TagRenderingStatus.new('amenity', 'bicycle_parking', :primary),
            TagRenderingStatus.new('amenity', 'bicycle_rental', :primary),
            TagRenderingStatus.new('amenity', 'biergarten', :primary),
            TagRenderingStatus.new('amenity', 'bus_station', :primary),
            TagRenderingStatus.new('amenity', 'cafe', :primary),
            TagRenderingStatus.new('amenity', 'car_rental', :primary),
            TagRenderingStatus.new('amenity', 'car_sharing', :primary),
            TagRenderingStatus.new('amenity', 'cinema', :primary),
            TagRenderingStatus.new('amenity', 'college', :primary),
            TagRenderingStatus.new('amenity', 'courthouse', :primary),
            TagRenderingStatus.new('amenity', 'dentist', :primary),
            TagRenderingStatus.new('amenity', 'drinking_water', :primary),
            TagRenderingStatus.new('amenity', 'doctors', :primary),
            TagRenderingStatus.new('amenity', 'embassy', :primary),
            TagRenderingStatus.new('amenity', 'emergency_phone', :primary),
            TagRenderingStatus.new('amenity', 'food_court', :primary),
            TagRenderingStatus.new('amenity', 'fast_food', :primary),
            TagRenderingStatus.new('amenity', 'fire_station', :primary),
            TagRenderingStatus.new('amenity', 'fuel', :primary),
            TagRenderingStatus.new('amenity', 'grave_yard', :primary),
            TagRenderingStatus.new('amenity', 'hospital', :primary),
            TagRenderingStatus.new('amenity', 'hunting_stand', :primary),
            TagRenderingStatus.new('amenity', 'kindergarten', :primary),
            TagRenderingStatus.new('amenity', 'library', :primary),
            TagRenderingStatus.new('amenity', 'parking', :primary),
            TagRenderingStatus.new('amenity', 'pharmacy', :primary),
            TagRenderingStatus.new('amenity', 'place_of_worship', :primary),
            TagRenderingStatus.new('amenity', 'police', :primary),
            TagRenderingStatus.new('amenity', 'post_box', :primary),
            TagRenderingStatus.new('amenity', 'post_office', :primary),
            TagRenderingStatus.new('amenity', 'prison', :primary),
            TagRenderingStatus.new('amenity', 'pub', :primary),
            TagRenderingStatus.new('amenity', 'recycling', :primary),
            TagRenderingStatus.new('amenity', 'restaurant', :primary),
            TagRenderingStatus.new('amenity', 'school', :primary),
            TagRenderingStatus.new('amenity', 'shelter', :primary),
            TagRenderingStatus.new('amenity', 'telephone', :primary),
            TagRenderingStatus.new('amenity', 'theatre', :primary),
            TagRenderingStatus.new('amenity', 'toilets', :primary),
            TagRenderingStatus.new('amenity', 'townhall', :primary),
            TagRenderingStatus.new('amenity', 'university', :primary),
            TagRenderingStatus.new('amenity', 'waste_basket', :primary),
            TagRenderingStatus.new('area', 'no', :composite, {'barrier' => 'hedge'}),
            TagRenderingStatus.new('area', 'yes', :composite, {'barrier' => 'hedge'}),
            TagRenderingStatus.new('barrier', '*', :primary),
            TagRenderingStatus.new('barrier', 'block', :primary),
            TagRenderingStatus.new('barrier', 'bollard', :primary),
            TagRenderingStatus.new('barrier', 'embankment', :primary),
            TagRenderingStatus.new('barrier', 'gate', :primary),
            TagRenderingStatus.new('barrier', 'hedge', :primary),
            TagRenderingStatus.new('barrier', 'lift_gate', :primary),
            TagRenderingStatus.new('bicycle', 'designated', :composite, {'highway'=>'path'}),
            TagRenderingStatus.new('boundary', 'administrative', :composite, {'admin_level'=>'2'}),
            TagRenderingStatus.new('boundary', 'national_park', :primary),
            TagRenderingStatus.new('bridge', 'aqueduct', :composite, {'waterway'=>'river'}),
            TagRenderingStatus.new('bridge', 'boardwalk', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'cantilever', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'covered', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'low_water_crossing', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'movable', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'trestle', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'viaduct', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('bridge', 'yes', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('building', '*', :primary),
            TagRenderingStatus.new('building', 'no', :not_displayed),
            TagRenderingStatus.new('capital', 'yes', :composite, {'place'=>'city'}),
            TagRenderingStatus.new('capital', '4', :composite, {'place'=>'city'}),
            TagRenderingStatus.new('construction', 'bridleway', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'cycleway', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'footway', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'living_street', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'motorway', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'motorway_link', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'path', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'primary', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'primary_link', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'residential', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'secondary', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'secondary_link', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'service', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'tertiary', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'tertiary_link', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'track', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'trunk', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'trunk_link', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('construction', 'unclassified', :composite, {'highway'=>'construction'}),
            TagRenderingStatus.new('covered', 'yes', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('denomination', 'jehovahs_witness', :composite, {'amenity'=>'place_of_worship', 'religion'=>'christian'}),
            TagRenderingStatus.new('ele', '*', :composite, {'natural'=>'peak'}),
            TagRenderingStatus.new('foot', 'designated', :composite, {'highway'=>'path'}),
            TagRenderingStatus.new('generator:source', 'wind', :composite, {'power'=>'generator'}),
            TagRenderingStatus.new('highway', 'bridleway', :primary),
            TagRenderingStatus.new('highway', 'bus_guideway', :primary),
            TagRenderingStatus.new('highway', 'bus_stop', :primary),
            TagRenderingStatus.new('highway', 'construction', :primary),
            TagRenderingStatus.new('highway', 'cycleway', :primary),
            TagRenderingStatus.new('highway', 'footway', :primary),
            TagRenderingStatus.new('highway', 'ford', :primary),
            TagRenderingStatus.new('highway', 'living_street', :primary),
            TagRenderingStatus.new('highway', 'mini_roundabout', :primary),
            TagRenderingStatus.new('highway', 'motorway', :primary),
            TagRenderingStatus.new('highway', 'motorway_junction', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('highway', 'motorway_link', :primary),
            TagRenderingStatus.new('highway', 'path', :primary),
            TagRenderingStatus.new('highway', 'pedestrian', :primary),
            TagRenderingStatus.new('highway', 'platform', :primary),
            TagRenderingStatus.new('highway', 'primary', :primary),
            TagRenderingStatus.new('highway', 'primary_link', :primary),
            TagRenderingStatus.new('highway', 'proposed', :primary),
            TagRenderingStatus.new('highway', 'raceway', :primary),
            TagRenderingStatus.new('highway', 'residential', :primary),
            TagRenderingStatus.new('highway', 'rest_area', :primary),
            TagRenderingStatus.new('highway', 'road', :primary),
            TagRenderingStatus.new('highway', 'secondary', :primary),
            TagRenderingStatus.new('highway', 'secondary_link', :primary),
            TagRenderingStatus.new('highway', 'service', :primary),
            TagRenderingStatus.new('highway', 'services', :primary),
            TagRenderingStatus.new('highway', 'steps', :primary),
            TagRenderingStatus.new('highway', 'tertiary', :primary),
            TagRenderingStatus.new('highway', 'tertiary_link', :primary),
            TagRenderingStatus.new('highway', 'track', :primary),
            TagRenderingStatus.new('highway', 'traffic_signals', :primary),
            TagRenderingStatus.new('highway', 'trunk', :primary),
            TagRenderingStatus.new('highway', 'trunk_link', :primary),
            TagRenderingStatus.new('highway', 'turning_circle', :primary), #note: special topology is required
            TagRenderingStatus.new('highway', 'turning_loop', :primary), #note: special topology is required
            TagRenderingStatus.new('highway', 'unclassified', :primary),
            TagRenderingStatus.new('historic', 'archaeological_site', :primary),
            TagRenderingStatus.new('historic', 'castle_walls', :primary),
            TagRenderingStatus.new('historic', 'citywalls', :primary),
            TagRenderingStatus.new('historic', 'memorial', :primary),
            TagRenderingStatus.new('horse', 'designated', :composite, {'highway'=>'path'}),
            TagRenderingStatus.new('intermittent', 'yes', :composite, {'waterway'=>'river'}),
            TagRenderingStatus.new('junction', 'yes', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('junction', 'roundabout', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('landuse', 'allotments', :primary),
            TagRenderingStatus.new('landuse', 'basin', :primary),
            TagRenderingStatus.new('landuse', 'brownfield', :primary),
            TagRenderingStatus.new('landuse', 'cemetery', :primary),
            TagRenderingStatus.new('landuse', 'commercial', :primary),
            TagRenderingStatus.new('landuse', 'conservation', :primary),
            TagRenderingStatus.new('landuse', 'construction', :primary),
            TagRenderingStatus.new('landuse', 'farm', :primary),
            TagRenderingStatus.new('landuse', 'farmland', :primary),
            TagRenderingStatus.new('landuse', 'farmyard', :primary),
            TagRenderingStatus.new('landuse', 'forest', :primary),
            TagRenderingStatus.new('landuse', 'garages', :primary),
            TagRenderingStatus.new('landuse', 'grass', :primary),
            TagRenderingStatus.new('landuse', 'greenhouse_horticulture', :primary),
            TagRenderingStatus.new('landuse', 'industrial', :primary),
            TagRenderingStatus.new('landuse', 'landfill', :primary),
            TagRenderingStatus.new('landuse', 'meadow', :primary),
            TagRenderingStatus.new('landuse', 'military', :primary),
            TagRenderingStatus.new('landuse', 'orchard', :primary),
            TagRenderingStatus.new('landuse', 'quarry', :primary),
            TagRenderingStatus.new('landuse', 'railway', :primary),
            TagRenderingStatus.new('landuse', 'recreation_ground', :primary),
            TagRenderingStatus.new('landuse', 'reservoir', :primary),
            TagRenderingStatus.new('landuse', 'residential', :primary),
            TagRenderingStatus.new('landuse', 'retail', :primary),
            TagRenderingStatus.new('landuse', 'village_green', :primary),
            TagRenderingStatus.new('landuse', 'vineyard', :primary),
            TagRenderingStatus.new('layer', '1', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '2', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '3', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '4', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '5', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '-1', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '-2', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '-3', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '-4', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('layer', '-5', :composite, {'highway' => 'service'}), #modifies ordering
            TagRenderingStatus.new('leisure', 'common', :primary),
            TagRenderingStatus.new('leisure', 'garden', :primary),
            TagRenderingStatus.new('leisure', 'golf_course', :primary),
            TagRenderingStatus.new('leisure', 'marina', :primary),
            TagRenderingStatus.new('leisure', 'miniature_golf', :primary),
            TagRenderingStatus.new('leisure', 'nature_reserve', :primary),
            TagRenderingStatus.new('leisure', 'park', :primary),
            TagRenderingStatus.new('leisure', 'picnic_table', :primary),
            TagRenderingStatus.new('leisure', 'pitch', :primary),
            TagRenderingStatus.new('leisure', 'playground', :primary),
            TagRenderingStatus.new('leisure', 'recreation_ground', :primary),
            TagRenderingStatus.new('leisure', 'slipway', :primary),
            TagRenderingStatus.new('leisure', 'sports_centre', :primary),
            TagRenderingStatus.new('leisure', 'stadium', :primary),
            TagRenderingStatus.new('leisure', 'swimming_pool', :primary),
            TagRenderingStatus.new('leisure', 'track', :primary),
            TagRenderingStatus.new('leisure', 'water_park', :primary),
            TagRenderingStatus.new('man_made', 'breakwater', :primary),
            TagRenderingStatus.new('man_made', 'cutline', :primary),
            TagRenderingStatus.new('man_made', 'embankment', :primary),
            TagRenderingStatus.new('man_made', 'groyne', :primary),
            TagRenderingStatus.new('man_made', 'lighthouse', :primary),
            TagRenderingStatus.new('man_made', 'mast', :primary),
            TagRenderingStatus.new('man_made', 'pier', :primary),
            TagRenderingStatus.new('man_made', 'water_tower', :primary),
            TagRenderingStatus.new('man_made', 'windmill', :primary),
            TagRenderingStatus.new('military', 'danger_area', :primary),
            TagRenderingStatus.new('name', '*', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('natural', 'bare_rock', :primary),
            TagRenderingStatus.new('natural', 'bay', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('natural', 'beach', :primary),
            TagRenderingStatus.new('natural', 'cave_entrance', :primary),
            TagRenderingStatus.new('natural', 'cliff', :primary),
            TagRenderingStatus.new('natural', 'glacier', :primary),
            TagRenderingStatus.new('natural', 'grassland', :primary),
            TagRenderingStatus.new('natural', 'heath', :primary),
            TagRenderingStatus.new('natural', 'marsh', :primary),
            TagRenderingStatus.new('natural', 'mud', :primary),
            TagRenderingStatus.new('natural', 'peak', :primary),
            TagRenderingStatus.new('natural', 'sand', :primary),
            TagRenderingStatus.new('natural', 'scree', :primary),
            TagRenderingStatus.new('natural', 'saddle', :primary),
            TagRenderingStatus.new('natural', 'scrub', :primary),
            TagRenderingStatus.new('natural', 'shingle', :primary),
            TagRenderingStatus.new('natural', 'spring', :primary),
            TagRenderingStatus.new('natural', 'tree', :primary),
            TagRenderingStatus.new('natural', 'tree_row', :primary),
            TagRenderingStatus.new('natural', 'volcano', :primary),
            TagRenderingStatus.new('natural', 'water', :primary),
            TagRenderingStatus.new('natural', 'wetland', :primary),
            TagRenderingStatus.new('natural', 'wood', :primary),
            TagRenderingStatus.new('oneway', '-1', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('oneway', 'yes', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('place', 'city', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'farm', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'hamlet', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'island', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'islet', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'isolated_dwelling', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'locality', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'neighbourhood', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'suburb', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'town', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('place', 'village', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('power', 'generator', :primary),
            TagRenderingStatus.new('power', 'line', :primary),
            TagRenderingStatus.new('power', 'minor_line', :primary),
            TagRenderingStatus.new('power', 'pole', :primary),
            TagRenderingStatus.new('power', 'station', :primary),
            TagRenderingStatus.new('power', 'sub_station', :primary),
            TagRenderingStatus.new('power', 'substation', :primary),
            TagRenderingStatus.new('power', 'tower', :primary),
            TagRenderingStatus.new('power_source', 'wind', :composite, {'power'=>'generator'}),
            TagRenderingStatus.new('railway', 'construction', :primary),
            TagRenderingStatus.new('railway', 'disused', :primary),
            TagRenderingStatus.new('railway', 'funicular', :primary),
            TagRenderingStatus.new('railway', 'halt', :primary),
            TagRenderingStatus.new('railway', 'level_crossing', :primary),
            TagRenderingStatus.new('railway', 'light_rail', :primary),
            TagRenderingStatus.new('railway', 'miniature', :primary),
            TagRenderingStatus.new('railway', 'monorail', :primary),
            TagRenderingStatus.new('railway', 'narrow_gauge', :primary),
            TagRenderingStatus.new('railway', 'platform', :primary),
            TagRenderingStatus.new('railway', 'preserved', :primary),
            TagRenderingStatus.new('railway', 'rail', :primary),
            TagRenderingStatus.new('railway', 'station', :primary),
            TagRenderingStatus.new('railway', 'subway', :primary),
            TagRenderingStatus.new('railway', 'subway_entrance', :primary),
            TagRenderingStatus.new('railway', 'tram', :primary),
            TagRenderingStatus.new('railway', 'tram_stop', :primary),
            TagRenderingStatus.new('railway', 'turntable', :primary),
            TagRenderingStatus.new('ref', '*', :composite, {'aeroway'=>'gate'}),
            TagRenderingStatus.new('religion', 'buddhist', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'christian', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'hindu', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'jewish', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'muslim', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'shinto', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'sikh', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('religion', 'taoist', :composite, {'amenity'=>'place_of_worship'}),
            TagRenderingStatus.new('route', 'ferry', :primary),
            TagRenderingStatus.new('service', 'drive-through', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('service', 'driveway', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('service', 'parking_aisle', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('service', 'siding', :composite, {'railway'=>'rail'}),
            TagRenderingStatus.new('service', 'spur', :composite, {'railway'=>'rail'}),
            TagRenderingStatus.new('service', 'yard', :composite, {'railway'=>'rail'}),
            TagRenderingStatus.new('shop', 'accessories', :primary),
            TagRenderingStatus.new('shop', 'alcohol', :primary),
            TagRenderingStatus.new('shop', 'antique', :primary),
            TagRenderingStatus.new('shop', 'antiques', :primary),
            TagRenderingStatus.new('shop', 'appliance', :primary),
            TagRenderingStatus.new('shop', 'art', :primary),
            TagRenderingStatus.new('shop', 'baby_goods', :primary),
            TagRenderingStatus.new('shop', 'bag', :primary),
            TagRenderingStatus.new('shop', 'bags', :primary),
            TagRenderingStatus.new('shop', 'bakery', :primary),
            TagRenderingStatus.new('shop', 'bathroom_furnishing', :primary),
            TagRenderingStatus.new('shop', 'beauty', :primary),
            TagRenderingStatus.new('shop', 'bed', :primary),
            TagRenderingStatus.new('shop', 'betting', :primary),
            TagRenderingStatus.new('shop', 'beverages', :primary),
            TagRenderingStatus.new('shop', 'bicycle', :primary),
            TagRenderingStatus.new('shop', 'boat', :primary),
            TagRenderingStatus.new('shop', 'bookmaker', :primary),
            TagRenderingStatus.new('shop', 'books', :primary),
            TagRenderingStatus.new('shop', 'boutique', :primary),
            TagRenderingStatus.new('shop', 'builder', :primary),
            TagRenderingStatus.new('shop', 'building_materials', :primary),
            TagRenderingStatus.new('shop', 'butcher', :primary),
            TagRenderingStatus.new('shop', 'camera', :primary),
            TagRenderingStatus.new('shop', 'car', :primary),
            TagRenderingStatus.new('shop', 'car_parts', :primary),
            TagRenderingStatus.new('shop', 'car_repair', :primary),
            TagRenderingStatus.new('shop', 'car_service', :primary),
            TagRenderingStatus.new('shop', 'carpet', :primary),
            TagRenderingStatus.new('shop', 'charity', :primary),
            TagRenderingStatus.new('shop', 'cheese', :primary),
            TagRenderingStatus.new('shop', 'chemist', :primary),
            TagRenderingStatus.new('shop', 'chocolate', :primary),
            TagRenderingStatus.new('shop', 'clothes', :primary),
            TagRenderingStatus.new('shop', 'coffee', :primary),
            TagRenderingStatus.new('shop', 'communication', :primary),
            TagRenderingStatus.new('shop', 'computer', :primary),
            TagRenderingStatus.new('shop', 'confectionery', :primary),
            TagRenderingStatus.new('shop', 'convenience', :primary),
            TagRenderingStatus.new('shop', 'copyshop', :primary),
            TagRenderingStatus.new('shop', 'cosmetics', :primary),
            TagRenderingStatus.new('shop', 'craft', :primary),
            TagRenderingStatus.new('shop', 'curtain', :primary),
            TagRenderingStatus.new('shop', 'dairy', :primary),
            TagRenderingStatus.new('shop', 'deli', :primary),
            TagRenderingStatus.new('shop', 'delicatessen', :primary),
            TagRenderingStatus.new('shop', 'department_store', :primary),
            TagRenderingStatus.new('shop', 'discount', :primary),
            TagRenderingStatus.new('shop', 'dive', :primary),
            TagRenderingStatus.new('shop', 'doityourself', :primary),
            TagRenderingStatus.new('shop', 'dry_cleaning', :primary),
            TagRenderingStatus.new('shop', 'e-cigarette', :primary),
            TagRenderingStatus.new('shop', 'electrical', :primary),
            TagRenderingStatus.new('shop', 'electronics', :primary),
            TagRenderingStatus.new('shop', 'energy', :primary),
            TagRenderingStatus.new('shop', 'erotic', :primary),
            TagRenderingStatus.new('shop', 'estate_agent', :primary),
            TagRenderingStatus.new('shop', 'fabric', :primary),
            TagRenderingStatus.new('shop', 'farm', :primary),
            TagRenderingStatus.new('shop', 'fashion', :primary),
            TagRenderingStatus.new('shop', 'fish', :primary),
            TagRenderingStatus.new('shop', 'fishing', :primary),
            TagRenderingStatus.new('shop', 'fishmonger', :primary),
            TagRenderingStatus.new('shop', 'flooring', :primary),
            TagRenderingStatus.new('shop', 'florist', :primary),
            TagRenderingStatus.new('shop', 'food', :primary),
            TagRenderingStatus.new('shop', 'frame', :primary),
            TagRenderingStatus.new('shop', 'frozen_food', :primary),
            TagRenderingStatus.new('shop', 'funeral_directors', :primary),
            TagRenderingStatus.new('shop', 'furnace', :primary),
            TagRenderingStatus.new('shop', 'furniture', :primary),
            TagRenderingStatus.new('shop', 'gallery', :primary),
            TagRenderingStatus.new('shop', 'gambling', :primary),
            TagRenderingStatus.new('shop', 'games', :primary),
            TagRenderingStatus.new('shop', 'garden_centre', :primary),
            TagRenderingStatus.new('shop', 'gas', :primary),
            TagRenderingStatus.new('shop', 'general', :primary),
            TagRenderingStatus.new('shop', 'gift', :primary),
            TagRenderingStatus.new('shop', 'glaziery', :primary),
            TagRenderingStatus.new('shop', 'greengrocer', :primary),
            TagRenderingStatus.new('shop', 'grocery', :primary),
            TagRenderingStatus.new('shop', 'hairdresser', :primary),
            TagRenderingStatus.new('shop', 'hardware', :primary),
            TagRenderingStatus.new('shop', 'health', :primary),
            TagRenderingStatus.new('shop', 'health_food', :primary),
            TagRenderingStatus.new('shop', 'hearing_aids', :primary),
            TagRenderingStatus.new('shop', 'herbalist', :primary),
            TagRenderingStatus.new('shop', 'hifi', :primary),
            TagRenderingStatus.new('shop', 'hobby', :primary),
            TagRenderingStatus.new('shop', 'household', :primary),
            TagRenderingStatus.new('shop', 'houseware', :primary),
            TagRenderingStatus.new('shop', 'hunting', :primary),
            TagRenderingStatus.new('shop', 'ice_cream', :primary),
            TagRenderingStatus.new('shop', 'insurance', :primary),
            TagRenderingStatus.new('shop', 'interior_decoration', :primary),
            TagRenderingStatus.new('shop', 'jewellery', :primary),
            TagRenderingStatus.new('shop', 'jewelry', :primary),
            TagRenderingStatus.new('shop', 'kiosk', :primary),
            TagRenderingStatus.new('shop', 'kitchen', :primary),
            TagRenderingStatus.new('shop', 'laundry', :primary),
            TagRenderingStatus.new('shop', 'leather', :primary),
            TagRenderingStatus.new('shop', 'lighting', :primary),
            TagRenderingStatus.new('shop', 'locksmith', :primary),
            TagRenderingStatus.new('shop', 'lottery', :primary),
            TagRenderingStatus.new('shop', 'mall', :composite, {'name'=>'a'}),
            TagRenderingStatus.new('shop', 'market', :primary),
            TagRenderingStatus.new('shop', 'massage', :primary),
            TagRenderingStatus.new('shop', 'medical', :primary),
            TagRenderingStatus.new('shop', 'medical_supply', :primary),
            TagRenderingStatus.new('shop', 'mobile_phone', :primary),
            TagRenderingStatus.new('shop', 'money_lender', :primary),
            TagRenderingStatus.new('shop', 'motorcycle', :primary),
            TagRenderingStatus.new('shop', 'motorcycle_repair', :primary),
            TagRenderingStatus.new('shop', 'music', :primary),
            TagRenderingStatus.new('shop', 'musical_instrument', :primary),
            TagRenderingStatus.new('shop', 'newsagent', :primary),
            TagRenderingStatus.new('shop', 'office_supplies', :primary),
            TagRenderingStatus.new('shop', 'optician', :primary),
            TagRenderingStatus.new('shop', 'organic', :primary),
            TagRenderingStatus.new('shop', 'outdoor', :primary),
            TagRenderingStatus.new('shop', 'paint', :primary),
            TagRenderingStatus.new('shop', 'pastry', :primary),
            TagRenderingStatus.new('shop', 'pawnbroker', :primary),
            TagRenderingStatus.new('shop', 'perfumery', :primary),
            TagRenderingStatus.new('shop', 'pet', :primary),
            TagRenderingStatus.new('shop', 'pharmacy', :primary),
            TagRenderingStatus.new('shop', 'phone', :primary),
            TagRenderingStatus.new('shop', 'photo', :primary),
            TagRenderingStatus.new('shop', 'photo_studio', :primary),
            TagRenderingStatus.new('shop', 'photography', :primary),
            TagRenderingStatus.new('shop', 'pottery', :primary),
            TagRenderingStatus.new('shop', 'printing', :primary),
            TagRenderingStatus.new('shop', 'radiotechnics', :primary),
            TagRenderingStatus.new('shop', 'real_estate', :primary),
            TagRenderingStatus.new('shop', 'religion', :primary),
            TagRenderingStatus.new('shop', 'rental', :primary),
            TagRenderingStatus.new('shop', 'salon', :primary),
            TagRenderingStatus.new('shop', 'scuba_diving', :primary),
            TagRenderingStatus.new('shop', 'seafood', :primary),
            TagRenderingStatus.new('shop', 'second_hand', :primary),
            TagRenderingStatus.new('shop', 'sewing', :primary),
            TagRenderingStatus.new('shop', 'shoe_repair', :primary),
            TagRenderingStatus.new('shop', 'shoes', :primary),
            TagRenderingStatus.new('shop', 'shopping_centre', :primary),
            TagRenderingStatus.new('shop', 'solarium', :primary),
            TagRenderingStatus.new('shop', 'souvenir', :primary),
            TagRenderingStatus.new('shop', 'sports', :primary),
            TagRenderingStatus.new('shop', 'stationery', :primary),
            TagRenderingStatus.new('shop', 'supermarket', :primary),
            TagRenderingStatus.new('shop', 'tailor', :primary),
            TagRenderingStatus.new('shop', 'tanning', :primary),
            TagRenderingStatus.new('shop', 'tattoo', :primary),
            TagRenderingStatus.new('shop', 'tea', :primary),
            TagRenderingStatus.new('shop', 'ticket', :primary),
            TagRenderingStatus.new('shop', 'tiles', :primary),
            TagRenderingStatus.new('shop', 'tobacco', :primary),
            TagRenderingStatus.new('shop', 'toys', :primary),
            TagRenderingStatus.new('shop', 'trade', :primary),
            TagRenderingStatus.new('shop', 'travel_agency', :primary),
            TagRenderingStatus.new('shop', 'tyres', :primary),
            TagRenderingStatus.new('shop', 'vacuum_cleaner', :primary),
            TagRenderingStatus.new('shop', 'variety_store', :primary),
            TagRenderingStatus.new('shop', 'video', :primary),
            TagRenderingStatus.new('shop', 'video_games', :primary),
            TagRenderingStatus.new('shop', 'watches', :primary),
            TagRenderingStatus.new('shop', 'wholesale', :primary),
            TagRenderingStatus.new('shop', 'wine', :primary),
            TagRenderingStatus.new('shop', 'winery', :primary),
            TagRenderingStatus.new('shop', 'yes', :primary),
            TagRenderingStatus.new('tourism', 'alpine_hut', :primary),
            TagRenderingStatus.new('tourism', 'attraction', :primary),
            TagRenderingStatus.new('tourism', 'camp_site', :primary),
            TagRenderingStatus.new('tourism', 'caravan_site', :primary),
            TagRenderingStatus.new('tourism', 'chalet', :primary),
            TagRenderingStatus.new('tourism', 'guest_house', :primary),
            TagRenderingStatus.new('tourism', 'hostel', :primary),
            TagRenderingStatus.new('tourism', 'hotel', :primary),
            TagRenderingStatus.new('tourism', 'information', :primary),
            TagRenderingStatus.new('tourism', 'motel', :primary),
            TagRenderingStatus.new('tourism', 'museum', :primary),
            TagRenderingStatus.new('tourism', 'picnic_site', :primary),
            TagRenderingStatus.new('tourism', 'theme_park', :primary),
            TagRenderingStatus.new('tourism', 'viewpoint', :primary),
            TagRenderingStatus.new('tourism', 'zoo', :primary),
            TagRenderingStatus.new('tracktype', 'grade1', :composite, {'highway' => 'track'}),
            TagRenderingStatus.new('tracktype', 'grade2', :composite, {'highway' => 'track'}),
            TagRenderingStatus.new('tracktype', 'grade3', :composite, {'highway' => 'track'}),
            TagRenderingStatus.new('tracktype', 'grade4', :composite, {'highway' => 'track'}),
            TagRenderingStatus.new('tracktype', 'grade5', :composite, {'highway' => 'track'}),
            TagRenderingStatus.new('tunnel', 'building_passage', :composite, {'highway' => 'service'}),
            TagRenderingStatus.new('tunnel', 'culvert', :composite, {'waterway'=>'river'}),
            TagRenderingStatus.new('tunnel', 'yes', :composite, {'highway'=>'service'}),
            TagRenderingStatus.new('waterway', 'canal', :primary),
            TagRenderingStatus.new('waterway', 'dam', :primary),
            TagRenderingStatus.new('waterway', 'derelict_canal', :primary),
            TagRenderingStatus.new('waterway', 'ditch', :primary),
            TagRenderingStatus.new('waterway', 'dock', :primary),
            TagRenderingStatus.new('waterway', 'drain', :primary),
            TagRenderingStatus.new('waterway', 'lock_gate', :primary),
            TagRenderingStatus.new('waterway', 'river', :primary),
            TagRenderingStatus.new('waterway', 'riverbank', :primary),
            TagRenderingStatus.new('waterway', 'stream', :primary),
            TagRenderingStatus.new('waterway', 'wadi', :primary),
            TagRenderingStatus.new('waterway', 'weir', :primary),
        ]
    end

    def self.get_composite_sets
      return [
          {'name' => 'a'}, #place=city...
          {'highway' => 'service'}, #access, ref, bridge, tunnel, service=parking_aisle...
          {'railway' => 'rail'}, #service=siding
          {'boundary' => 'administrative'}, #admin_level
          {'admin_level' => '2'}, #boundary=administrative
          {'natural' => 'peak'}, #ele=*
          {'ref' => '3'}, #aeroway=gate
          {'aeroway' => 'gate'}, #ref=*
          {'amenity' => 'place_of_worship'}, #religion=christian
          {'amenity' => 'place_of_worship', 'religion' => 'christian'}, #denomination=jehovahs_witness
          {'waterway' => 'river'}, #bridge=aqueduct, tunnel=culvert, intermittent=yes
          {'power' => 'generator'}, #power_source=wind
          {'highway' => 'path'}, #bicycle=designated
          {'highway' => 'construction'}, #construction=motorway...
          {'highway' => 'track'}, #tracktype=grade1...
          {'amenity' => 'parking'}, #access=*...
          #{'barrier' => 'hedge'}, #area=yes
      ]
    end
  end
end
