require_relative 'restaurant'

class Customer

  def initialize
    @restaurant
  end

# allows you to place duplicate orders without a flag
	def place_order(restaurant, name, volume)
		if volume >= 1
		restaurant.order_received(self, name, volume)
		else
		nil_order_warning
		end
	end

	def nil_order_warning
		puts "you have ordered with a volume of zero, please place order again"
	end

	def not_on_menu(name)
		puts "sorry #{name} not on menu"
	end


end
