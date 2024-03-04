# Creating class for the Product
class Product
    attr_accessor :name, :price, :quantity, :type
  
    # Constructure for initializing the product with given values
    def initialize(name, price, quantity, type)
      @name = name
      @price = price
      @quantity = quantity
      @type = type
    end
  
    # to sting method
    def to_s
      "#{name}, #{price} RS, #{quantity}, #{type}"
    end
  end
  
  # Initialize the inventory list with given products
  inventory = [
    Product.new("lettuce", 10.5, 50, "Leafy green"),
    Product.new("cabbage", 20, 100, "Cruciferous"),
    Product.new("pumpkin", 30, 30, "Marrow"),
    Product.new("cauliflower", 10, 25, "Cruciferous"),
    Product.new("zucchini", 20.5, 50, "Marrow"),
    Product.new("yam", 30, 50, "Root"),
    Product.new("spinach", 10, 100, "Leafy green"),
    Product.new("broccoli", 20.2, 75, "Cruciferous"),
    Product.new("garlic", 30, 20, "Leafy green"),
    Product.new("silverbeet", 10, 50, "Marrow")
  ]
  
  # 1. Print the total number of products in the list
  puts "1. Total number of products: #{inventory.size}"
  
  # 2. Add a new product (Potato,10RS, 50, Root)
  inventory << Product.new("Potato", 10, 50, "Root")
  puts "\n2. After adding Potato:"
  inventory.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  puts "Total number of products: #{inventory.size}"
  
  # 3. Print all the products of which have the type Leafy green
  puts "\n3. Products of type Leafy green:"
  leafy_green_products = inventory.select { |product| product.type == "Leafy green" }
  leafy_green_products.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  
  # 4. Remove Garlic from the list and print the total number of products left
  inventory.delete_if { |product| product.name == "garlic" }
  puts "\n4. After removing Garlic:"
  inventory.each_with_index { |product, index| puts "#{index + 1}. #{product}" }
  puts "Total number of products: #{inventory.size}"
  
  # 5. Final quantity of cabbage in the inventory if 50 more cabbages are added
  cabbage = inventory.find { |product| product.name == "cabbage" }
  cabbage.quantity += 50
  puts "\n5. Final quantity of cabbage: #{cabbage.quantity}"
  
  # 6. Calculate the total price for purchasing 1 kg lettuce, 2 kg zucchini, 1 kg broccoli
  lettuce_price = inventory.find { |product| product.name == "lettuce" }.price
  zucchini_price = inventory.find { |product| product.name == "zucchini" }.price
  broccoli_price = inventory.find { |product| product.name == "broccoli" }.price
  
  total_price = 1 * lettuce_price + 2 * zucchini_price + 1 * broccoli_price
  puts "\n6. Total price for purchasing: #{total_price.round(2)} RS"
  