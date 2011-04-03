module SimpleGeolocation
  module Geoworkers
    class Base

      attr_reader :location, :geocoder, :success
      alias :success? :success

      def initialize(geocoder)
        @geocoder = geocoder
      end

      def process!
        raise NotImplementedError
      end

      def self.instantiate_geoworker_based_on(geocoder)
        if geocoder.ip?
          GeoIP.new(geocoder)
        elsif geocoder.zip?
          Geozip.new(geocoder)
        else
          Geokit.new(geocoder)
        end
      end
    end
  end
end
