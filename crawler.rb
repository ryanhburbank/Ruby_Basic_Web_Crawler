require 'nokogiri'
require 'open-uri'
require 'CSV'

#Get a Nokogiri::HTML::Document for the page

doc = Nokogiri::HTML(open('ebay.html', 
                          'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36'))


# Class names to look for : nume_item_title, nume_price, nume_b_format span, 
# 1. Capture all titles as an array.
# 2. 


# [Title: ?, Price: ?, Format: ?]
#
# 
# 
# 
# 
# 
# 

# class ItemInfo
# 	def get_title
# 	end

# 	def get_price
# 	end


# end

title_array = []
price_array = []
order_option = []
item_array = []
item = {}

doc.css('.nume_item_title').each do |title|
	title = title.text.gsub("\n",'')
  title_array << title
end
doc.css('.nume_price').each do |price|
	price = price.text.gsub("\n",'')
	price_array << price
end
doc.css('.nume_b_format span').each do |order|
	order = order.text.gsub("\n", '')
	order_option << order
end 

(title_array.length).times do |i|
	item = { :title => title_array[i],
					 :price => price_array[i],
					 :order_option => order_option[i]}
	item_array << item
end

