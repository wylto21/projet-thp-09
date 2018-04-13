#Inclusion des gems ruby pour pouvoir les utiliser partout dans le code
require 'nokogiri'
require 'open-uri'
require 'pry'

incubators_directory_url = "http://www.incubateur.co/incubateurs"

def get_incubators_details(directory_url)
	page = Nokogiri::HTML(open(directory_url))

	array_of_results = []
	anchor_selector = "td.views-field.views-field-field-logo-incubateur > a"
	nodeset_of_td = page.css('td.views-field.views-field-title') #Récupère tous les <td> qui match avec le selecteur
	i  = 0

	#Itération sur nodeset_of_td. Pour chaque <td> on crée un hash qui associe le nom(td_node.text) de l'incubateur qu'il contient au code postal et url correspondant
	nodeset_of_td.each do |td_node|
		array_of_results.push( {:name => td_node.text, :postal_code => page.css('span.postal-code')[i].text, :website => page.css(anchor_selector)[i].values[0] } )
		i += 1
	end
		
	puts array_of_results
	
end

get_incubators_details(incubators_directory_url)