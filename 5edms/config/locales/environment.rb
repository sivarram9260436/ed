# Load the rails application
require File.expand_path('../application', __FILE__)
#for bytesize error
require "rack/content_length"
class << (Rack::ContentLength)
  def new(app)
    app
  end
end
# Initialize the rails application
App1::Application.initialize!
