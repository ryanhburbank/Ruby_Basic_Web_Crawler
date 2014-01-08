require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Get a Nokogiri::HTML::Document for the page

doc = Nokogiri::HTML(open('http://kwazarmultimedia.com/cityspa/bullshit.htm', 
                          'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22'))

# doc.css('h1').each do |title|
#   puts title.content
# end
puts doc
