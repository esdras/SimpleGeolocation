require 'geokit'
module SimpleGeolocation
  module Geoworkers
    class Geokit < Base

      def process!
        get_location!
        geocoder.success! if success?
      end

      private

      def multi_geocoder
        @multi_geocoder ||= ::Geokit::Geocoders::MultiGeocoder
      end

      def get_location!
        result = multi_geocoder.geocode(geocoder.raw_location.removeaccents)
        if @success = result.success
          @location = Location.new(
            :lat => result.lat,
            :lng => result.lng,
            :city => result.city,
            :state => result.state,
            :country => result.country,
            :street => result.street_name,
            :number => result.street_number,
            :zip => result.zip,
            :district => result.district,
            :provider => result.provider
          )
        end
      end

    end
  end
end
