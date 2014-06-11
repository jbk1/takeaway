require_relative 'restaurant'

class Customer

	def initialize(restaurant)
		@restaurant = restaurant
	end


	def place_order(restaurant, name, volume)
		@restaurant.order_received(self, name, volume)
	end


end
