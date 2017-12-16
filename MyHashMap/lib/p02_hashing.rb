class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    return 0 if self.empty?
    self.each_with_index do |el, idx|
      result += (el.ord * (idx+1))

    end
    result.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    return 0 if self.empty?
    temp = self.keys.map(&:to_s)
    temp.each do |string|
      result += string.hash
    end
    temp2 = self.values.map(&:to_s)
    temp2.each do |string|
      result += string.hash
    end
    
    result
  end
end
