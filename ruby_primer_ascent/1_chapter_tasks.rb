# 0.0 Blocks

Addition = lambda {|a, b| return a + b } 

Subtraction = lambda {|a,b| return a - b}

Multiplication = lambda {|a, b| return a * b }

Division = lambda { |a,b| return a / b }

# 0.1 Yield

def prettify_it
  return "The result of the block was: #{yield}"
end

# 0.2 Implicit and Explicit Blocks

def filter(array, block)
  return array.select &block
end

Filter = lambda do |array, &block|
  array.select &block
end

# 0.3 The Devil and the Details: Syntax
# no tasks

# 0.4 Blocks, Procs, and Lambdas
# no tasks

# 1.0 Classification

def know_it_all(object)
  if object.class == String
    String
  elsif object.class == Fixnum
    Fixnum
  elsif object.class == Array
    Array
  elsif object.class == Hash
    Hash
  end
end

# 1.1 Undersstanding Inheritance

def is_ancestor?(klass, subclass)
  first_check = subclass.superclass == klass ? true : false
  second_check = subclass.superclass.superclass == klass ? true : false
  if !first_check
    second_check
  else
    first_check
  end
end

# 1.2 Inheriting Class

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

class Square < Rectangle
  def initialize(side)
    @length = side
    @breadth = side
  end
end

# 1.3 Redefinig, overriding, and super

class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

class Human < Animal
  def move
    super + " by walking"
  end
end

class Penguin < Bird
  def move
    "I can move by swimming"
  end
end