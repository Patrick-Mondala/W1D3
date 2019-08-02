def range(start, ending)
    return [] if ending <= start
    [start] + range(start+1, ending)
end

def sum(array)
    return array[0] if array.length == 1
    array[0] + sum(array[1..-1])
end

def iterative_sum(array)
    sum = 0
    array.each{|ele| sum += ele}
    sum
end

def exponent_1(num, pow)
    return 1 if pow == 0
    num * exponent_1(num, pow - 1)
end

def exponent_2(num, pow)
    return 1 if pow == 0
    return num if pow == 1
    if pow.even?
        exponent_2(num, pow / 2) ** 2
    else
        num * (exponent_2(num, (pow - 1) / 2) ** 2)
    end
end

class Array
    def deep_dup
        new_array = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_array << ele.deep_dup
            else
                new_array << ele
            end
        end
        new_array
    end
end

def fibonacci(n)
    return [0, 1].take(n) if n <= 2
    fib = fibonacci(n-1) 
    fib << fib[-1] + fib[-2]
end

def iter_fibonacci(n)
    return [0] if n == 1
    fib = [0,1]
    return fib if n == 2

    (n-2).times{fib << fib[-1] + fib[-2]}
    fib
end

def bsearch(array, target)
    return nil unless array.include?(target)

    array.sort!
    middle = array.length/2
    compare = (array[middle] <=> target)
    if compare == 1
        bsearch(array[0...middle], target)
    elsif compare == 0
        return middle
    else
        middle + bsearch(array[middle+1..-1], target) + 1
    end
end

class Array
    def merge_sort ## works on self (array)
        return self if self.length <= 1

        middle = self.length/2
        left = self[0...middle]
        right = self[middle..-1]
        sorted_left = left.merge_sort
        sorted_right = right.merge_sort
        merge(sorted_left, sorted_right)
    end

    def merge(el1, el2)
        new_arr = []
        until el1.empty? || el2.empty?
            if el2.first > el1.first
                new_arr << el1.shift
            else
                new_arr << el2.shift
            end
        end
        new_arr + el1 + el2
    end

    ## [1, 2] => [[], [1], [2], [1,2]]
    #[1,2,3]
     # - those that don't contain 3
                # - ^^ + 3

                # [1, 2, 3] = > [1, 2] => [[], [1], [2], [1,2]]
                #                 [1, 2] => [[3], [1, 3], [2, 3], [1,2, 3]]
                # [1, 2] => [[], [1], [2], [1,2]]
                # [[], [1]]
                #     [[2],[1,2]]
    def subsets
        return [[]] if self.empty?
        return [[], self] if self.length == 1

        sub = self[0..-2].subsets
        sub + sub.map{|ele| ele += [self.last]}
    end
end

# [1] => [[1]]
# [1,2] => [[1, 2], [2, 1]] 
# [1, 2, 3] => [1,2,3], [2,1,3] [3,2,1] [3,1,2]
# a = [1, 2, 3]
# a.permutation.to_a    
#=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
def permutations(arr)
    return [] if arr.empty?
    return [arr] if arr.length == 1
    
    first = arr.shift
    perms = permutations(arr)
    permutated = []
    perms.each do |sub|
        (0..sub.length).each do |i|
            permutated << sub[0...i] + [first] + sub[i..-1]
        end
    end

    permutated
end

def greedy_make_change(amt, coins)
    coins.sort!
    return [] if amt == 0
    result = 0
    used_coins = []
    until result > amt
        result += coins.max
        used_coins << coins.max 
    end
    result -= coins.max
    used_coins.pop
    difference = amt - result
    used_coins += greedy_make_change(difference, coins[0..-2])
end

def make_better_change(amt, coins)
    return [] if amt == 0
    coins.sort!

    #result 24 coins [10, 7, 1]
    #greedy => 10, 10, 1, 1, 1, 1
    #better => 10, 7, 7
    coins.each_with_index do |coin, i|
        difference = amt - coin
        lesser_coins = coins[0...i]
    end
end