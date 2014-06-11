require_relative 'restaurant'

class Customer

	def initialize(restaurant_instance)
		@restaurant = restaurant_instance
	end


	def place_order(restaurant, name, volume)
		@restaurant.order_received(self, name, volume)
	end

	def not_on_menu(name)
		puts "sorry #{name} not on menu"
	end

end
