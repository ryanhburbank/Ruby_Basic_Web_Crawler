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

class Item
	attr_accessor :title, :price, :order_option

	def initialize(title, price, order_option)
		self.title = title
		self.price = price
		self.order_option = order_option
	end

	def to_s
		"Title: #{title}, Price: #{price}, Order Option: #{order_option}"
	end
end

class GetInfo
	attr_accessor :doc, :items

	def initialize(url)
		self.doc = url
		title_array = write_type('.nume_item_title')
		price_array = write_type('.nume_price')
		order_option = write_type('.nume_b_format')
		self.items = create_items(title_array, price_array, order_option)
	end

	def write_type(css_class)
		type_array = []
		doc.css(css_class).each do |type|
			type = type.text.gsub("\n", '')
			type_array << type
		end
		type_array
	end

	def create_items(titles, prices, order_options)
		item_array = []
		(titles.length).times do |i|
			item = Item.new(titles[i], prices[i], order_options[i])
			item_array << item
		end
		item_array
	end
end

new_data = GetInfo.new(doc)
puts new_data.items

