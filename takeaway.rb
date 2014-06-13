require './lib/restaurant'
require './lib/customer'

restaurant = Restaurant.new
customer = Customer.new
restaurant.place_order(customer, name, volume)