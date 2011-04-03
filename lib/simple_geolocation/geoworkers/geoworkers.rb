module SimpleGeolocation
  module Geoworkers
    autoload :Base, 'simple_geolocation/geoworkers/base'
    autoload :GeoIP, 'simple_geolocation/geoworkers/geoip/geoip'
    autoload :Geokit, 'simple_geolocation/geoworkers/geokit/geokit'
    autoload :Geozip, 'simple_geolocation/geoworkers/geozip/geozip'
  end
end
