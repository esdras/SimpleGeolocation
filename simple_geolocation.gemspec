# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_geolocation/version"

Gem::Specification.new do |s|
  s.name        = "simple_geolocation"
  s.version     = SimpleGeolocation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Esdras Mayrink"]
  s.email       = ["falecom@oesdras.com.br"]
  s.homepage    = "https://github.com/esdras/SimpleGeolocation"
  s.summary     = %q{A gem that fetch locations based on IP, ZIP and ordinary address through several existing geolocation gems.}
  s.description = %q{
    This gem is used with geolocation in mind, meaning that the main goal is to get a latitude and longitude, but it will return additional data if
    available. With this gem you can pass an IP number or an ZIP number or an ordinary address and it will try to get as many information as possible
    about the given argument.
  }

  s.add_development_dependency "rspec"
  s.add_dependency "geokit"
  s.add_dependency "activesupport"
  s.add_dependency "brcep"

  s.rubyforge_project = "simple_geolocation"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
