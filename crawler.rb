require 'nokogiri'
require 'open-uri'

#Get a Nokogiri::HTML::Document for the page

doc = Nokogiri::HTML(open('http://www.ebay.com/itm/CHLOE-GREY-BOOTS-SIZE-38-5-/181292865028?pt=US_Women_s_Shoes&hash=item2a35e59604', 
                          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36)

# doc.css('h1').each do |title|
#   puts title.content
# end
puts doc
