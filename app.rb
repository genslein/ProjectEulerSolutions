require 'sinatra'
require 'rubygems'
require 'bundler'

Bundler.require(:default, settings.environment) if defined?(Bundler) # make sure we have the correct gems to get off the ground

$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require File.join(File.dirname(__FILE__), 'config', 'default')

#load all controllers
Dir[File.join(File.dirname(__FILE__), 'controllers', '*.rb')].each { |file| require file }
