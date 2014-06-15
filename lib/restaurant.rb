require_relative 'customer'

class Restaurant

	attr_accessor :menu
	attr_accessor :orders

	def initialize
		@menu = []
		@orders = []
	end

# allows you to create duplicate dishes! need to write a map and if not present addition here.
	def create_dish(name, price)
		menu << {name: name, price: price}
	end

	def delete_dish(name)
		menu.delete_if do |item| 
			item[:name] == name 
		end
	end

	def display_menu
		print menu_contents
	end

# How would we get a nicely formatted output, with not customer ID's but the variable names' they're assigned to?
	def display_order_contents
		@orders.each {|item| print item, " -- "}
	end

	def menu_contents
		menu.map { |dish| "#{dish[:name]} : £#{price_for(dish)}" }.join("\n")
	end

	def price_for(dish)
		sprintf("%0.2f", dish[:price])
	end

	def order_received(customer, name, volume)
		if @menu.any? { |h| h[:name] == name}
		@orders << {customer: customer, name: name, volume: volume}
		else
			customer.not_on_menu(name)
		end
	end

	def print_orders
		@orders   
	end

 	def customer_order_items(customer)
 		order = @orders.select {|o| o[:customer] == customer}
 		# order.each {|item| print item[][:name]}
 		# trying to do the above to better format the print out, but runs error 'args 0 for 1'????
 	end

	def customer_order_total(customer)
		customer_order_items(customer).inject(0) do |sum,item|
			menu_item = @menu.select {|m| m[:name] == item[:name]}
			menu_item_volume = customer_order_items(customer)[0][:volume]
			sum += (menu_item[0][:price] * menu_item_volume)
		end
	end

 	def confirm_order(customer)
 		order_items = customer_order_items(customer)
 		form_order_items = 
 		order_items.map { |dish| "#{dish[:name]} : x#{dish[:volume]}" }
 		puts "We are confirming your order, it contains these items:#{form_order_items}"
 		total_bill = customer_order_total(customer)
 		print "total bill: £#{total_bill}"
 		

		end
	end
