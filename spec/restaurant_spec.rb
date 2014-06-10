require 'restaurant'

describe Restaurant do
	
	 let(:restaurant) {Restaurant.new} 

	context 'has a menu of dishes' do

		it "has a menu with a dish with two key values, name and price" do
		restaurant.create_dish('Fish & chips', 7.00)
		expect(restaurant.menu).to eq [{name: 'Fish & chips', price: 7.00}]
		end

		it 'has a menu with multiple dises' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.create_dish('Cornish pastie', 8.00)
			expect(restaurant.menu).to eq [{name: 'Roast beef', price: 15.00}, {name: 'Shepherds pie', price: 10.00}, {name: 'Cornish pastie', price: 8.00}]
		end

		it 'can delete dishes from the menu' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.delete_dish('Roast beef')
			expect(restaurant.menu).to eq [{name: 'Shepherds pie', price: 10.00}]
		end

		it 'can print a menu' do
			restaurant.create_dish('Roast beef', 15.00)
			restaurant.create_dish('Shepherds pie', 10.00)
			restaurant.create_dish('Cornish pastie', 8.00)
			message = "Roast beef : £15.00\nShepherds pie : £10.00\nCornish pastie : £8.00"

			expect(restaurant.menu_contents).to eq message

		end

		xit 'can receive an order from a customer' do
		 customer = C
		end

		xit 'can add up the total price of an order' do
		end

		xit 'can tell a customer about an order' do
		end




	end
end