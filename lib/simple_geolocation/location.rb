module SimpleGeolocation
  class Location
    ATTRIBUTES = [:lat, :lng, :city, :state, :country, :provider, :zip, :street, :district, :number]
    attr_accessor *ATTRIBUTES

    def initialize(attributes = {})
      unknown_attributes = attributes.keys.reject { |k| ATTRIBUTES.include?(k) }
      raise ArgumentError, "Unknown parameters: #{unknown_attributes.join(', ')}" unless unknown_attributes.empty?
      attributes.each do |k, v|
        send("#{k}=", v)
      end
    end

    def completeness(attributes = ATTRIBUTES)
      total = attributes.size
      used = attributes.reject {|attr| send(attr).blank? }.size
      return 100 if used >= total
      (used.to_f / total.to_f * 100.0).to_i
    end

  end
end

