# 2.0 Instance Variables and Accessors

class Item
  def initialize(description, color)
    @description = description
    @color = color
  end
  
  def description
    @description = @color
  end
end

###

class Item
  def initialize(item_name, quantity)
    @item_name = item_name
    @quantity = quantity
  end
  
  def quantity=(new_quantity)
    @quantity = new_quantity
  end
  
  def quantity
    @quantity
  end  
end

item = Item.new("a",1)
item.quantity = 3
p item.quantity

# 2.1 Class Variables and Methods

class ApplicationConfiguration
  def self.set(property_name, value)
    @property_name = property_name
    @value = value
  end
  
  def self.get(property_name)
    @value
  end
end

ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

p ApplicationConfiguration.get("version")

###

class ApplicationConfiguration
  @configuration = {}

  def self.set(property, value)
    @configuration[property] = value
  end

  def self.get(property)
    @configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name")

# Equality of Objects

class Item
    attr_reader :item_name, :qty
    
    def initialize(item_name, qty)
        @item_name = item_name
        @qty = qty
    end
    def to_s
        "Item (#{@item_name}, #{@qty})"
    end
    def ==(other_item)
      if other_item.item_name == @item_name && other_item.qty == @qty
        true
      end
    end
end

p Item.new("abcd",1)  == Item.new("abcd",1)
p Item.new("abcd",2)  == Item.new("abcd",1)

###

class Item
  attr_reader :item_name, :quantity, :supplier_name, :price
  
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end 
  
  def ==(other_item)
    self.eql?(other_item)
  end
  
  def eql?(other_item)
    @item_name == other_item.item_name &&
    @quantity == other_item.quantity &&
    @supplier_name == other_item.supplier_name &&
    @price == other_item.price
  end
  
  def hash
    @item_name.hash ^ @quantity.hash ^ @supplier_name.hash ^ @price.hash
  end
end

# 2.3 Displaying Objcects: puts and p, to_s and inspect

class Item
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  
  def to_s 
    return "#{@item_name} and #{@qty}"
  end
end

item = Item.new("a",1)

puts item
p item

# 2.4 Serializing

class CerealBox
  attr_accessor :ounces, :contains_toy
  
  def initialize(ounces, contains_toy)
    @ounces = ounces
    @contains_toy = contains_toy
  end
  
  def self.from_s(s)
    ounces = 0
    contains_toy = false
    s.each_line do |field|
      value = field.split(":")[1].strip
      ounces = value.to_i if field.include?("ounces")
      contains_toy = to_boolean(value) if field.include?("contains_toy")
    end
    CerealBox.new(ounces, contains_toy)
  end
  
  def self.to_boolean(str)
    str == 'true'
  end
  
  def to_s
    "ounces: #{@ounces}\n contains_toy: #{@contains_toy}"
  end
end

puts "example to_s: #{CerealBox.new(4, true).to_s}"
puts "example from_s: #{CerealBox.from_s(CerealBox.new(10, false).to_s)}"