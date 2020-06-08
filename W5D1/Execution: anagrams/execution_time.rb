require "byebug"
def my_min(list)
    result = 0
    # list.each.with_index do |ele, idx|
    #     list.each.with_index do |ele2, idx2|
    #         if idx2 > idx && ele < ele2
    #             result = ele
    #         end
    #     end
    # end
    # result
    (0...list.length).each do |i| #O(n)
        if list[i] <= result 
            result = list[i]
        end
    end
    result
end

# p list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#does phase 1 and two at once


def largest_contiguous_subsum(list)
    arr = []
    result = nil


    list.each_index do |i|
        (i...list.length).each do |i2|
            arr << list[i..i2]
        end
    end
    
    arr.each_with_index do |subarr, idx|
        if idx == 0
            result = subarr.sum
        elsif subarr.sum > result
            result = subarr.sum
        end
    end

    result
end

def largest_contiguous_subsum_efficient(list)
    max = list.first
    current = list.first
    #[5, 3, -7]
    (1...list.length).each do |i|
        if current < 0
            current = 0
        end
        current += list[i]
        if current > max
            max = current
        end
    end
    max
end


# [[5], [5, 3], [5, 3, -7], [3], [3, -7], [-7]]
# p list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
# p list2 = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list2) # => 8 (from [7, -6, 7])
# p list3 = [-5, -1, -3]
# p largest_contiguous_subsum(list3) # => -1 (from [-1])

p list = [5, 3, -7]
p largest_contiguous_subsum_efficient(list) # => 8
p list2 = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_efficient(list2) # => 8 (from [7, -6, 7])
p list3 = [-5, -1, -3]
p largest_contiguous_subsum_efficient(list3) # => -1 (from [-1])
