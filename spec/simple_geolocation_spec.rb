# coding: utf-8
require File.join(File.dirname(__FILE__), '..', 'lib', 'simple_geolocation')

describe SimpleGeolocation do

  it 'should identify if the given location is a zip' do
    @geo = SimpleGeolocation::Geocoder.new("89237-440")
    @geo.zip?.should be_true
    @geo.address?.should be_false
  end

  it 'should identify if the given location is an address' do
    @geo = SimpleGeolocation::Geocoder.new("Joinville - SC")
    @geo.address?.should be_true
    @geo.zip?.should be_false
  end

  it "should return the location of an ordinary address" do
    @geo = SimpleGeolocation::Geocoder.new("Rua do Principe, 199, Joinville, SC")
    @geo.address?.should be_true
    @geo.geocode!
    @geo.success?.should be_true
    @geo.lat.should == -26.3009192
    @geo.lng.should == -48.8452937
    @geo.completeness.should == 90
  end

  it "should return the location of a brazilian zipcode (CEP)" do
    @geo = SimpleGeolocation::Geocoder.new("22640100")
    @geo.zip?.should be_true
    @geo.geocode!
    @geo.success?.should be_true
    @geo.street.should == "Avenida das Américas"
    @geo.district.should == "Barra da Tijuca"
    @geo.state.should == "Rio de Janeiro"
    @geo.city.should == "Rio De Janeiro"
    @geo.zip.should == "22640-100"
    @geo.lat.should == -23.0032808
    @geo.lng.should == -43.3230295
    @geo.completeness.should == 90
  end

end
