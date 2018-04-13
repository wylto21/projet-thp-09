# Trader de l'obscur

require 'nokogiri'
require 'open-uri'

def trader_obscur

      # définir l'URL pour pointer vers l'emplacement de la page
  link_url = 'https://coinmarketcap.com/all/views/all/'
  site_page = Nokogiri::HTML(open(link_url))

    var = 0
  site_page.css('.currency-name-container').each do |name|
  puts name.content + " : " + site_page.css(".price")[var].content
  var+=1
  end
end
trader_obscur()
