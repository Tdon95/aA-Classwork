
require "byebug"
class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    if is_valid?(num)
      self.store[num] = true
    else
      validate!(num)
    end
  end

  def remove(num)
    self.store[num] = false
  end

  def include?(num)
    self.store[num] == tru
  end


  private

  def is_valid?(num)
    num.between?(0, store.length - 1)
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % num_buckets
    @store[bucket] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = num % num_buckets
    if !store[bucket].include?(num)
      @store[bucket] << num

      @count += 1
    end
    # debugger
    if count > num_buckets
      # debugger
      @count = 0
      resize!
    end
  end

  def remove(num)
    if @store[num % num_buckets].include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dups = @store.dup
    @store = Array.new(@store.length * 2) {Array.new}
    # debugger
    dups.flatten.each do |int|
      # debugger
      insert(int)
      # debugger
    end
  end
end
