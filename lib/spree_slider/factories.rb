require 'factory_bot'

Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each do |f|
  load File.expand_path(f)
end
