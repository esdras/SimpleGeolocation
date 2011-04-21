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
        if @success  = result && result.latitude.present? && result.longitude.present?
            new_raw_location = "#{result.latitude}, #{result.longitude}"
            geokit = Geokit.new(Geocoder.new(new_raw_location))
            geokit.process!
            @success = geokit.success?
            @location = geokit.location
        else
          Geokit.new(geocoder).process!
        end
      end

    end
  end
end
