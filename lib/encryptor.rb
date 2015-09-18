require 'date'

class Key

  attr_accessor :key

  def initialize
    @key = key
  end

  def random_generator
    array = []
    5.times do
      array << rand(10)
    end
    @key = array
  end

end

class Offsets

  attr_accessor :offsets, :integer_date

  def initialize
    @offsets = offsets
    @integer_date = integer_date
  end

  def offsets_array
    date = Date.today.strftime("%d%m%y")
    integer_date = date.to_i
    squared_date = integer_date ** 2
    squared_string = squared_date.to_s
    squared_array = squared_string.split("").map do |n|
      n.to_i
    end
    squared_array.last(4)
  end
end

class Encryptor

  attr_accessor :key, :offsets, :key_a, :key_b, :key_c, :key_d


  def initialize
    @key     = Key.new.random_generator
    @offsets = Offsets.new.offsets_array
  end

  def key_a
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[0] + @key[1]
    @key_a = key_a_string.to_i
  end

  def key_b
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[1] + @key[2]
    @key_b = key_a_string.to_i
  end

  def key_c
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[2] + @key[3]
    @key_c = key_a_string.to_i
  end

  def key_d
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[3] + @key[4]
    @key_d = key_a_string.to_i
  end

  def key_array
    @key_array = []
    @key_array.insert(0, key_a)
    @key_array.insert(1, key_b)
    @key_array.insert(2, key_c)
    @key_array.insert(3, key_d)
    @key_array
  end

  def offsets_a
    @offsets_a = @offsets[0]
  end

  def offsets_b
    @offsets_b = @offsets[1]
  end

  def offsets_c
    @offsets_c = @offsets[2]
  end

  def offsets_d
    @offsets_d = @offsets[3]
  end

  def rotation
    @rotation = []
    @rotation.insert(0, key_a + offsets_a)
    @rotation.insert(1, key_b + offsets_b)
    @rotation.insert(2, key_c + offsets_c)
    @rotation.insert(3, key_d + offsets_d)
    @rotation
  end
end

value = Encryptor.new  # => #<Encryptor:0x007fa0a48f1e88 @key=[3, 4, 5, 4, 6], @offsets=[7, 2, 2, 5]>
value.key_a            # => 34
value.key_b            # => 45
value.key_c            # => 54
value.key_d            # => 46
value.key_array        # => [34, 45, 54, 46]
value.offsets_a        # => 7
value.offsets_b        # => 2
value.offsets_c        # => 2
value.offsets_d        # => 5
value.rotation         # => [41, 47, 56, 51]
