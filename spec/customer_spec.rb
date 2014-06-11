require 'customer'

describe Customer do
  it 'can place an order ' do
    customer = Customer.new(restaurant)
    expect(restaurant).to receive(:order_received).with(customer, 'name', 3)

    customer.place_order(restaurant,'name', 3)    
  end
end