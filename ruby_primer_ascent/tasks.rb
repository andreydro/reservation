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