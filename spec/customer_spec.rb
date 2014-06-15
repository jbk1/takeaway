require 'customer'

	describe Customer do

	  it 'can place an order ' do
	    restaurant1 = Restaurant.new
	    customer = Customer.new

	    expect(restaurant1).to receive(:order_received).with(customer, 'name', 3)

	    customer.place_order(restaurant1,'name', 3)    
		end
	
	# what this should really be is multiple items within one order, maybe there shoudl be another method of additional_items_in_order for e.g.
		xit 'can place multiple orders' do
			restaurant1 = Restaurant.new
	    james = Customer.new
	    restaurant1.create_dish('tea', 2.00)
			restaurant1.create_dish('scone', 2.50)

	    expect(restaurant1.orders).to eq([{customer: 'james', name: 'tea', volume: 2},{customer: 'james', name: 'scone', volume: 3}])

	    james.place_order(restaurant1, 'tea', 2)
			james.place_order(restaurant1, 'scone', 3)
		end

	end