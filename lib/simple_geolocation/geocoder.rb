module SimpleGeolocation
  class Geocoder

    attr_reader :success, :raw_location, :location
    alias :success? :success

    def self.keys
      Location::ATTRIBUTES + [:completeness]
    end

    delegate :lat, :lng, :city, :state, :country, :provider, :zip, :zipcode, :street, :district, :number, :completeness, :to => :location

    def initialize(raw_location)
      @raw_location = raw_location
    end

    # Only brazilian zipcode is supported.
    def zip?
      number = @raw_location.to_s.gsub(/(\.|\D|\-|\s)/, '')
      number.size == 8
    end

    def address?
      !zip?
    end

    def geocode!
      @geoworker = Geoworkers::Base.instantiate_geoworker_based_on(self)
      @geoworker.process!
      @location = @geoworker.location
    end

    def success!
      @success = true
    end

    def attributes
      @attributes ||= Hash[self.class.keys.map { |k| [k, send(k)] }]
    end

  end
end
