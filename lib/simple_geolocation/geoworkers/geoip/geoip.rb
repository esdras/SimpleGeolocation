require 'geoip'
module SimpleGeolocation
  module Geoworkers
    class GeoIP < Base

      def process!
        get_location!
        geocoder.success! if success?
      end

      private

      def ip_geocoder
        @ip_geocoder ||= ::GeoIP.new(File.join(File.dirname(__FILE__), 'data', 'GeoLiteCity.dat'))
      end

      def get_location!
        result = ip_geocoder.city(geocoder.raw_location)
        if @success  = result && result.city_name.present? && result.region_name.present?
          @location = Location.new(
            :lat => result.latitude,
            :lng => result.longitude,
            :city => result.city_name,
            :state => result.region_name,
            :provider => "geoip"
          )
        else
          Geokit.new(geocoder).process!
        end
      end

    end
  end
end
