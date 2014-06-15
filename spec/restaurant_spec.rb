require 'restaurant'
require 'customer'

describe Restaurant do
	
	let(:restaurant) {Restaurant.new} 

	context 'has a menu of dishes' do

		it "has a menu with a dish with two key values, name and price" do
		  restaurant.create_dish('Fish & chips', 7.00)
		  expect(restaurant.menu).to eq [{name: 'Fish & chips', price: 7.00}]
		end

		it 'has a menu with multiple dishes' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.create_dish('Cornish pastie', 8.00)
			expect(restaurant.menu).to include({name: 'Roast beef', price: 15.00})
			expect(restaurant.menu).to include({name: 'Shepherds pie', price: 10.00})
			expect(restaurant.menu).to include({name: 'Cornish pastie', price: 8.00})
		end

		it 'can delete dishes from the menu' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.delete_dish('Roast beef')
			expect(restaurant.menu).to eq [{name: 'Shepherds pie', price: 10.00}]
		end

		it 'list of dishes with prices' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.create_dish('Cornish pastie', 8.00)
			message = "Roast beef : £15.00\nShepherds pie : £10.00\nCornish pastie : £8.00"

			expect(restaurant.menu_contents).to eq message
		end
	end

	context 'dealing with customers' do

			# records the order, checks ordered item is present and calculates total.
			
		it 'can receive an order from a customer' do
			restaurant1 = Restaurant.new
			customer1 = Customer.new
			expect(restaurant1).to receive(:order_received).with(customer1, 'tea', 2)
			customer1.place_order(restaurant1, 'tea', 2)
		end

		it 'can receive multiple orders from a customer' do
			restaurant1 = Restaurant.new
			customer1 = Customer.new
			restaurant1.create_dish('coffee', 2)
			restaurant1.create_dish('tea', 2)
			customer1.place_order(restaurant1, 'tea', 2)
			customer1.place_order(restaurant1, 'coffee', 3)

			expect(restaurant1.orders).to eq([{customer: customer1, name: 'tea', volume: 2},{customer: customer1, name: 'coffee', volume: 3}])
		end

		it 'returns an error if ordered is not on menu' do
			restaurant1 = Restaurant.new
			customer1 = Customer.new
			restaurant1.create_dish('coffee', 2)
			expect(customer1).to receive(:not_on_menu)
			customer1.place_order(restaurant1, 'tea', 2)
		end

		it 'can add up the total price of an order' do
			restaurant1 = Restaurant.new
			customer1 = Customer.new
			restaurant1.create_dish('coffee', 2)
			restaurant1.create_dish('tea', 2)
			customer1.place_order(restaurant1, 'tea', 2)
			customer1.place_order(restaurant1, 'coffee', 2)
			expect(restaurant1.customer_order_total(customer1)). to eq 8
		end		






# what about an order with 0 as volume raising an error?
		it 'confirm order by giving the list of dishes, their quantities, and the total price'


	end
end