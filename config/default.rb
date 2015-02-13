configure do
  enable :logging
end

#load the correct config for the current environment (development, test, staging, production) set by RACK_ENV environment variable
require File.join(File.dirname(__FILE__), settings.environment.to_s)

