# make sure we have the correct gems to get off the ground
require 'rubygems'
require 'bundler'
Bundler.require(:default, :test) if defined?(Bundler) 

require 'sinatra'
require 'rack/test'

# set up the environment explicitly
set :environment, :test
ENV['RACK_ENV'] = 'test'

# code coverage
if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

require_relative '../app'
