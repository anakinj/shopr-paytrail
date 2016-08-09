$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start
end

require 'rails/engine'
require 'shopr/paytrail'
