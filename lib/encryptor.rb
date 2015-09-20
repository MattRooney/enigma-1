require 'date'  # => true

class Key

  attr_accessor :key  # => nil

  def initialize
    @key = key    # => nil
  end             # => :initialize

  def random_generator
    array = []           # => []
    5.times do           # => 5
      array << rand(10)  # => [8], [8, 5], [8, 5, 0], [8, 5, 0, 3], [8, 5, 0, 3, 4]
    end                  # => 5
    @key = array         # => [8, 5, 0, 3, 4]
  end                    # => :random_generator

end  # => :random_generator

class Offsets

  attr_accessor :offsets, :integer_date  # => nil

  def initialize
    @offsets = offsets            # => nil
    @integer_date = integer_date  # => nil
  end                             # => :initialize

  def offsets_array
    date = Date.today.strftime("%d%m%y")                 # => "200915"
    integer_date = date.to_i                             # => 200915
    squared_date = integer_date ** 2                     # => 40366837225
    squared_string = squared_date.to_s                   # => "40366837225"
    squared_array = squared_string.split("").map do |n|  # => ["4", "0", "3", "6", "6", "8", "3", "7", "2", "2", "5"]
      n.to_i                                             # => 4, 0, 3, 6, 6, 8, 3, 7, 2, 2, 5
    end                                                  # => [4, 0, 3, 6, 6, 8, 3, 7, 2, 2, 5]
    squared_array.last(4)                                # => [7, 2, 2, 5]
  end                                                    # => :offsets_array
end                                                      # => :offsets_array

class Encryptor

  attr_accessor :key, :offsets, :key_a, :key_b, :key_c, :key_d  # => nil


  def initialize
    @key     = Key.new.random_generator   # => [8, 5, 0, 3, 4]
    @offsets = Offsets.new.offsets_array  # => [7, 2, 2, 5]
  end                                     # => :initialize

  def key_a
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[0] + @key[1]
    @key_a = key_a_string.to_i
  end                                 # => :key_a

  def key_b
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[1] + @key[2]
    @key_b = key_a_string.to_i
  end                                 # => :key_b

  def key_c
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[2] + @key[3]
    @key_c = key_a_string.to_i
  end                                 # => :key_c

  def key_d
    @key = @key.map { |i| i.to_s}
    key_a_string = @key[3] + @key[4]
    @key_d = key_a_string.to_i
  end                                 # => :key_d

  def key_array
    @key_array = []
    @key_array.insert(0, key_a)
    @key_array.insert(1, key_b)
    @key_array.insert(2, key_c)
    @key_array.insert(3, key_d)
    @key_array
  end                            # => :key_array

  def offsets_a
    @offsets_a = @offsets[0]
  end                         # => :offsets_a

  def offsets_b
    @offsets_b = @offsets[1]
  end                         # => :offsets_b

  def offsets_c
    @offsets_c = @offsets[2]
  end                         # => :offsets_c

  def offsets_d
    @offsets_d = @offsets[3]
end                           # => :offsets_d

  def rotation
    @rotation = []
    @rotation.insert(0, key_a + offsets_a)
    @rotation.insert(1, key_b + offsets_b)
    @rotation.insert(2, key_c + offsets_c)
    @rotation.insert(3, key_d + offsets_d)
    @rotation
  end                                       # => :rotation
end                                         # => :rotation

result = Encryptor.new  # => #<Encryptor:0x007fe4b91b5ff8 @key=[8, 5, 0, 3, 4], @offsets=[7, 2, 2, 5]>
