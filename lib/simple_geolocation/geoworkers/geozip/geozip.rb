require 'brcep'
module SimpleGeolocation
  module Geoworkers
    class Geozip < Base

      def process!
        get_location!
        geocoder.success! if success?
      end

      private

      def get_location!
        begin
          result = ::BuscaEndereco.por_cep(geocoder.raw_location)
          if @success = result && result.present?
            street = "#{result.first} #{result.second}"
            other_location_data = result[2..-1].join(', ')
            new_raw_location = "#{street}, #{other_location_data}"
            geokit = Geokit.new(Geocoder.new(new_raw_location))
            geokit.process!
            @success = geokit.success?
            @location = geokit.location
          end
        rescue
          @success = false
        end
      end

    end
  end
end
