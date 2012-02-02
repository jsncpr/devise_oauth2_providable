require "mongoid"

Mongoid.configure do |config|
  host = "localhost"
  name = "devise_oauth2_providable"
  config.master = Mongo::Connection.new.db(name)
end
