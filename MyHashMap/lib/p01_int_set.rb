class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max)
  end

  def insert(num)
    unless is_valid?(num)
      raise "Out of bounds"
    end

    unless include?(num)
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num unless @store.include?(num)
  end

  def remove(num)
    i = num % 20
    @store[i].delete(num)
  end

  def include?(num)
    i = num % 20
    @store[i].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  # attr_reader :count
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0

  end

  def insert(num)

    unless include?(num)
      if @count == num_buckets
        resize!
      end
      self[num] << num
      @count += 1
    end
    # p @store[i]
  end

  def remove(num)
    i = num % num_buckets
    if include?(num)
      @store[i].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # if count == num_buckets
      new_num_buckets = num_buckets * 2
      new_arr = ResizingIntSet.new(new_num_buckets)
      # new_arr = Array.new(new_num_buckets) { Array.new }
      @store.flatten.each do |num|

          new_arr.insert(num)

      end
    # end
    @store = new_arr.store

  end
end
