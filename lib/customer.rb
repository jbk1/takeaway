require_relative 'restaurant'

class Customer

  def initialize
    @restaurant
  end

# allows you to place duplicate orders without a flag
	def place_order(restaurant, name, volume)
		restaurant.order_received(self, name, volume)
	end

	def not_on_menu(name)
		puts "sorry #{name} not on menu"
	end

	def confirmed_order

	end


end
