require 'restaurant'

describe Restaurant do
	
	 let(:restaurant) {Restaurant.new} 

	context 'has a menu of dishes' do

		it "each dish has two key values, name and price" do
		restaurant.create_dish('fish & chips', 5.00)
		expect(restaurant.menu).to eq [{name: 'fish & chips', price: 5.00}]
		end

	end
end