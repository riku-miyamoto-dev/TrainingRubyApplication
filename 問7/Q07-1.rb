require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document
doc = Nokogiri::HTML5(URI.open('https://www.kurobe-dam.com/'))


doc.css('img[src$=".png"]').each do |link|
  puts "https://www.kurobe-dam.com#{link["src"]}"
end