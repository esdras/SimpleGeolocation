# coding: utf-8
require File.join(File.dirname(__FILE__), '..', 'lib', 'simple_geolocation')

describe SimpleGeolocation do


  it 'should identify if the given location is an ip' do
    @geo = SimpleGeolocation::Geocoder.new("189.58.112.247")
    @geo.ip?.should be_true
    @geo.zip?.should be_false
    @geo.address?.should be_false
  end

  it 'should identify if the given location is a zip' do
    @geo = SimpleGeolocation::Geocoder.new("89237-440")
    @geo.ip?.should be_false
    @geo.zip?.should be_true
    @geo.address?.should be_false
  end

  it 'should identify if the given location is an address' do
    @geo = SimpleGeolocation::Geocoder.new("Joinville - SC")
    @geo.ip?.should be_false
    @geo.address?.should be_true
    @geo.zip?.should be_false
  end

  it "should return the location of an user's based on IP" do
    @geo = SimpleGeolocation::Geocoder.new("189.58.112.247")
    @geo.ip?.should be_true
    @geo.geocode!
    @geo.success?.should be_true
    @geo.lat.should == -26.3001576
    @geo.lng.should == -48.8320838
    @geo.city.should == "Joinville"
    @geo.state.should == "SC"
    @geo.country.should == "Brasil"
    @geo.completeness.should == 90
  end

  it "should return the location of an ordinary address" do
    @geo = SimpleGeolocation::Geocoder.new("Rua do Principe, 199, Joinville, SC")
    @geo.address?.should be_true
    @geo.geocode!
    @geo.success?.should be_true
    @geo.lat.should == -26.30101
    @geo.lng.should == -48.8452974
    @geo.completeness.should == 90
  end

  it "should return the location of a brazilian zipcode (CEP)" do
    @geo = SimpleGeolocation::Geocoder.new("22640100")
    @geo.zip?.should be_true
    @geo.geocode!
    @geo.success?.should be_true
    @geo.street.should == "Av. Das Américas"
    @geo.district.should == "Barra da Tijuca"
    @geo.state.should == "RJ"
    @geo.city.should == "Rio De Janeiro"
    @geo.zip.should == "22640-100"
    @geo.lat.should == -23.0032808
    @geo.lng.should == -43.3230295
    @geo.completeness.should == 90
  end

end
