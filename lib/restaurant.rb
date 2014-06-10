
class Restaurant

	attr_accessor :menu

	def initialize
		@menu ||= []
	end

	def create_dish(name, price)
		menu << {name: name, price: price}
	end

	def delete_dish(name)
		menu.delete_if { |item| item[:name] == name }
	end

	def display_menu
		print menu_contents
	end

	def menu_contents
		menu.map { |dish| "#{dish[:name]} : £#{price_for(dish)}" }.join("\n")
	end

	def price_for(dish)
		sprintf("%0.2f", dish[:price])
	end
end

