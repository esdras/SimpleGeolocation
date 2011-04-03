module SimpleGeolocation
  class Geocoder

    attr_reader :success, :raw_location, :location
    alias :success? :success

    delegate *(Location::ATTRIBUTES + [:completeness]), :to => :location

    def initialize(raw_location)
      @raw_location = raw_location
    end

    def ip?
      !!/^(\d+\.){3}\d+$/.match(@raw_location)
    end

    # Only brazilian zipcode is supported.
    def zip?
      return false if ip?
      number = @raw_location.to_s.gsub(/(\.|\D|\-|\s)/, '')
      number.size == 8
    end

    def address?
      !ip? && !zip?
    end

    def geocode!
      @geoworker = Geoworkers::Base.instantiate_geoworker_based_on(self)
      @geoworker.process!
      @location = @geoworker.location
    end

    def success!
      @success = true
    end

  end
end
