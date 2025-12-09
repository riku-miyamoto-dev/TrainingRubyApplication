require 'nokogiri'
require 'open-uri'

html_document = Nokogiri::HTML5(URI.open('https://www.kurobe-dam.com/'))

html_document.css('img[src$=".png"]').each do |html_element|
  # 取得できるURLがhttps://www.kurobe-dam.comからの相対パスであるため、全文出力するようにhttps://www.kurobe-dam.comを追加
  puts "https://www.kurobe-dam.com#{html_element["src"]}"
end