#age = 42
#name = "Homer"

# Array, = is a function, not an operator, in Ruby.
# .. is a range object type
#ages = [1..42]

# Word array, only works with single words, don't need to use quotes though
#days = %W{Monday Tuesday Wednesday}

# Hash
#person = {name: "Homer", age: "42"}

#people = []

# Push person into people array, now an array of the hash
#people << person

# Methods are a thing an object can do. 
# Properties, attributes, fields = what it is (color, etc)

# Alex, write a library app for books we own with Title, Author, type (ebook, real)
# ISBN, genre, etc

# Class (code you write to define the object) blueprint for object, object is the thing
# Instance of object, unique created instance of object at runtime
class Item

	#These take an array of symbols, write the code for you
	# Same as the Getter functions below, EXACT same
	# attr_reader :name, :price
	# Same as the Setter functions below
	# attr_writer :name, :price
	#Does the same as the above two IF it's in both
	attr_accessor :name, :price, :quantity

	#constructor - ruby seldom needs it.  Never used for work, set up internal state of object
		# initializations of fields, etc.

	def initialize(name, price, quantity)
		#these are private
		# @ is similar to "this", instance variable (actual variable in the object)
		@name = name
		@price = price
		@quantity = quantity

		# Getter is a function, exposes the above for the outside, becomes a method on the object
		# Get data (instance variable value)
		#def get_name
		#	@name
		#end

		#def get_price
		#	@price
		#end

		# Setters encourage bad behavior (changing the properties), sets data
		# The below is logic that would be ok, logic guarding
		#def change_price(price)
		#end

		#def set_price=(new_price)
		#	@price = new_price
		#end

	end

	def to_s
		"Name: #{@name} - Price: #{price} - Quantity: #{quantity}"
	end

end

class Cart

	def initialize
		@items = []
		#{item {name, price}}
	end

	#method
	def add_to_cart(item)
		#push item passed in to the array of items
		@quantities = {}
		##Push item:quantity hash into array, look for item in array.  if it exists increment, if not leave it at 1
		##"enumerable"
		@items << @quantities

		if @items.include? '#{item.name}'
			@quantities.map{|quantity| quantity+=quantity}
		end
	end

	#to_s on the cart
	def to_s
		output = ""
		#Don't sort in to_s, make own method to sort by, call it later in cart
		#@items.sort_by{|item| item.name}.each do |item|
		@items.each do |item|
			#to_s on the item
			item.to_s
			# << is appending to the string here
			output << item.to_s+ "\n"
		end
		#self. is like "this"
		output << "Total Price: #{self.total}" + "\n" + "Total Items In Cart: #{self.qty_in_cart}"
	end

	def total
		sum = 0
		@items.each do |item|
			sum += item.price
		end
		sum
	end

	def qty_in_cart #shouldn't need 'each', should use enumable to go through array
		#Reduction [1,2,3].reduce(0){|prev, curr| prev + curr} ......prev starts at 0, then 0+1 = 1, then 1+2=3, then 3+3 = 6
		#reduce takes array puts into single value.  .map modifies values, but keeps same number of values
		#["Homer", "Bart", "Lisa"].map{|name| "#{name} Simpson"}
		cart_quantity = 0
		@items.each do |item|
			cart_quantity += item.quantity
		end
		cart_quantity
	end

end

widget = Item.new("Widget", 50, 6)
doodad = Item.new("Doodad", 25, 2)
foo = Item.new("Foo", 10, 12)

cart = Cart.new
cart.add_to_cart widget
cart.add_to_cart doodad
cart.add_to_cart foo

puts cart.to_s

#cart = [widget, doodad]
#total = 0

#cart.each do |item|
#	puts item.to_s
#	total += item.price
#end

#puts total

# OOP.  Tell, don't ask.

#puts widget.to_s
#puts doodad.to_s
#item = Item.new("Widget", 50)
#item.price= 100
#puts item.name
#puts item.price

# Java with a constructor, Java lets you have multiple constructors with different declarations
#class Person {

	#Constructor
#	public Person() {}
#}