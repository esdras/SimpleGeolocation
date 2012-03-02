require 'active_support/core_ext'
require File.join(File.dirname(__FILE__), 'simple_geolocation/utils/remove_accents')
module SimpleGeolocation
  autoload :Geocoder   , 'simple_geolocation/geocoder'
  autoload :Location   , 'simple_geolocation/location'
  autoload :Geoworkers , 'simple_geolocation/geoworkers/geoworkers'
end
