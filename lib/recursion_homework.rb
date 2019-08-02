# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

#   # Test Cases
#   sum_to(5)  # => returns 15
#   sum_to(1)  # => returns 1
#   sum_to(9)  # => returns 45
#   sum_to(-8)  # => returns nil

def sum_to(max)
    return 1 if max == 1

    max + sum_to(max - 1)
end

# Write a function add_numbers(nums_array) that takes in an array of Integers and returns the sum of those numbers. Write this method recursively.

#   # Test Cases
#   add_numbers([1,2,3,4]) # => returns 10
#   add_numbers([3]) # => returns 3
#   add_numbers([-80,34,7]) # => returns -39
#   add_numbers([]) # => returns nil

def add_numbers(nums_array)
    return nil if nums_array.length == 0
    return nums_array[0] if nums_array.length == 1

    nums_array[0] + add_numbers(nums_array[1..-1])
end

# Write a function ice_cream_shop(flavors, favorite) that takes in an array of ice cream flavors available at the ice cream shop, as well as the user's favorite ice cream flavor. Recursively find out whether or not the shop offers their favorite flavor.

#   # Test Cases
#   ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
#   ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
#   ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
#   ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
#   ice_cream_shop([], 'honey lavender')  # => returns false

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors[0] == favorite

    ice_cream_shop(flavors[1..-1], favorite)
end

# Write a function reverse(string) that takes in a string and returns it reversed.

#   # Test Cases
#   reverse("house") # => "esuoh"
#   reverse("dog") # => "god"
#   reverse("atom") # => "mota"
#   reverse("q") # => "q"
#   reverse("id") # => "di"
#   reverse("") # => ""

def reverse(str)
    return str if str.length <= 1
    reverse(str[1..-1]) + str[0]
end