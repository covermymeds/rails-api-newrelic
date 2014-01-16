# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails-api-newrelic/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-api-newrelic"
  spec.version       = RailsAPINewrelic::VERSION
  spec.authors       = ["Michael Gee"]
  spec.email         = ["mgee@covermymeds.com"]
  spec.description   = %q{New Relic integration for Rails API applications}
  spec.summary       = %q{see: https://github.com/rails-api/rails-api/issues/34}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails-api"
  spec.add_dependency "newrelic_rpm"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
