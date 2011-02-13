class Geov
  # TODO: update maxmind database task, url: http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
  
  # GEOIP = GeoIP.new('geoip/GeoIP.dat')
  ## GEOIP = GeoIP.new('GeoLiteCity.dat')
  
  # def self.infos(address)
  #   country(address)
  # end
  # 
  # def self.country(address)
  #   GEOIP.country address
  # end
  
  ##################################
  # geoip_city
  require 'geoip'
  #require 'geoip_city'
    
  # C api
  # http://geolite.maxmind.com/download/geoip/api/c/GeoIP.tar.gz
  
  DB = GeoIP.new  '/opt/GeoIP/share/GeoIP/GeoLiteCity.dat' 
  #DB = GeoIPCity::Database.new '/opt/GeoIP/share/GeoIP/GeoLiteCity.dat'
  
  #DBO = GeoIP.new '/opt/GeoIP/share/GeoIP/GeoIPOrg.dat'


  
  def initialize(address)
    @db = DB
    @address = address
    #@dbo = DBO
    #raise @db.inspect
  end
  
  def country;  @db.city(@address)[4]; end
  def city;     @db.city(@address)[7]; end
  def lat;      @db.city(@address)[9]; end
  def long;     @db.city(@address)[10]; end
    
  def gmaps_url
    "http://maps.google.com/maps?q=#{lat},#{long}&city=#{city}"
  end
  
  #def organization; @dbo.organization; end
end