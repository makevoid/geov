#require 'geov'
path = File.expand_path "../", __FILE__
require "#{path}/../lib/geov"

geov = Geov.new '151.16.218.168'
puts "#{geov.city} - #{geov.country}"
puts "gmaps: #{geov.gmaps_url}"