require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage
	# definir l'adress du site

  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/78/maule.html'))

  i = 0
  doc.css("body > div > main > section:nth-child(2) > div > table > tbody > tr:nth-child(4) > td:nth-child(2)").each do |email|
    puts "Adresse email: #{email.content}"

    i+=1
  end
end

def get_all_the_urls_of_val_doise_townhalls

    # définir l'URL pour pointer vers l'emplacement de la page
  url = 'http://annuaire-des-mairies.com/95/'
  page = Nokogiri::HTML(open(url))

  links = page.css('a')
  puts links
  links.each do |link|
    puts url + link['href']
  end
end

get_all_the_urls_of_val_doise_townhalls()

