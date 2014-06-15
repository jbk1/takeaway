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
 	end

	def customer_order_total(customer)
		customer_order_items(customer).inject(0) do |sum,item|
			menu_item = @menu.select {|m| m[:name] == item[:name]}
			menu_item_volume = customer_order_items(customer)[0][:volume]
			sum += (menu_item[0][:price] * menu_item_volume)
		end
	end

 	def confirm_order(customer)
 		print customer_order_items(customer)
 		customer_order_total(customer)
		end
	end
