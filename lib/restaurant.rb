
class Restaurant

attr_accessor :menu

def initialize
	@menu ||= []
end


def create_dish(name, price)
	menu << {name: name, price: price}

end




end