require 'nokogiri'
require 'open-uri'

base_url = 'https://www.kurobe-dam.com/'
html_document = Nokogiri::HTML5(URI.open(base_url))

html_document.xpath('//img[contains(@src,"img_sightseeing.jpg")]').each do |html_element|
  # 取得できるURLがhttps://www.kurobe-dam.comからの相対パスであるため、全文出力するようにhttps://www.kurobe-dam.comを追加
  puts File.join(base_url,html_element["src"])
end