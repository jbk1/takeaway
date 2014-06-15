require 'customer'

	describe Customer do

	  it 'can place an order' do
	    restaurant1 = Restaurant.new
	    customer = Customer.new

	    expect(restaurant1).to receive(:order_received).with(customer, 'name', 3)

	    customer.place_order(restaurant1,'name', 3)    
		end
	
		it 'will return an error if an order is places with a volume of zero' do
			restaurant1 = Restaurant.new
		  customer = Customer.new
			expect(customer).to receive(:nil_order_warning)		
			customer.place_order(restaurant1,'name', 0)
		end


	end
		# xit 'will flag a duplicate order to you'

