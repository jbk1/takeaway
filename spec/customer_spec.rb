require 'customer'

	describe Customer do

	  it 'can place an order ' do
	    restaurant1 = Restaurant.new
	    customer = Customer.new(restaurant1)

	    expect(restaurant1).to receive(:order_received).with(customer, 'name', 3)

	    customer.place_order(customer,'name', 3)    
		end
	end