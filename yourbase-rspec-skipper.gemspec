# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

require 'yourbase/rspec/skipper/version'

Gem::Specification.new do |s|
  s.name        = 'yourbase-rspec-skipper'
  s.version     = YourBase::RSpec::Skipper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['John Ewart']
  s.email       = ['john@yourbase.io']
  s.homepage    = 'https://github.com/yourbase/yourbase-rspec-skipper'
  s.summary     = 'Skip more tasks in YourBase'
  s.description = 'A library for use with YourBase that will enable using Skipper in the CI'
  s.license     = 'Apache-2.0'

  s.required_ruby_version = '>= 1.9.3'

  s.add_development_dependency 'rspec'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
