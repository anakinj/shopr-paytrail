# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shopr/paytrail/version'

Gem::Specification.new do |spec|
  spec.name          = 'shopr-paytrail'
  spec.version       = Shopr::Paytrail::VERSION
  spec.authors       = ['Joakim Antman']
  spec.email         = ['antmanj@gmail.com']

  spec.summary       = 'Shopr module for handling Paytrail integration'
  spec.homepage      = 'https://github.com/anakinj/shopr-paytrail'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.2'

  spec.add_dependency 'shopr'
  spec.add_dependency 'paytrail-client', '~> 0.1'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.11'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.3.0'
end
