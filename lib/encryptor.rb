require 'date'  # => true

class Key

  attr_accessor :key  # => nil

  def initialize
    @key = key    # => nil
  end             # => :initialize

  def random_generator
    array = []           # => []
    5.times do           # => 5
      array << rand(10)  # => [3], [3, 4], [3, 4, 5], [3, 4, 5, 4], [3, 4, 5, 4, 6]
    end                  # => 5
    @key = array         # => [3, 4, 5, 4, 6]
  end                    # => :random_generator

end  # => :random_generator

class Offsets

  attr_accessor :offsets, :integer_date  # => nil

  def initialize
    @offsets = offsets            # => nil
    @integer_date = integer_date  # => nil
  end                             # => :initialize

  def offsets_array
    date = Date.today.strftime("%d%m%y")                 # => "170915"
    integer_date = date.to_i                             # => 170915
    squared_date = integer_date ** 2                     # => 29211937225
    squared_string = squared_date.to_s                   # => "29211937225"
    squared_array = squared_string.split("").map do |n|  # => ["2", "9", "2", "1", "1", "9", "3", "7", "2", "2", "5"]
      n.to_i                                             # => 2, 9, 2, 1, 1, 9, 3, 7, 2, 2, 5
    end                                                  # => [2, 9, 2, 1, 1, 9, 3, 7, 2, 2, 5]
    squared_array.last(4)                                # => [7, 2, 2, 5]
  end                                                    # => :offsets_array
end                                                      # => :offsets_array

class Encryptor
  attr_accessor :key, :offsets, :key_a, :key_b, :key_c, :key_d  # => nil

  def initialize
    @key     = Key.new.random_generator   # => [3, 4, 5, 4, 6]
    @offsets = Offsets.new.offsets_array  # => [7, 2, 2, 5]
  end                                     # => :initialize

  def key_a
    @key = @key.map { |i| i.to_s}     # => ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"]
    key_a_string = @key[0] + @key[1]  # => "34", "34", "34"
    @key_a = key_a_string.to_i        # => 34, 34, 34
  end                                 # => :key_a

  def key_b
    @key = @key.map { |i| i.to_s}     # => ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"]
    key_a_string = @key[1] + @key[2]  # => "45", "45", "45"
    @key_b = key_a_string.to_i        # => 45, 45, 45
  end                                 # => :key_b

  def key_c
    @key = @key.map { |i| i.to_s}     # => ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"]
    key_a_string = @key[2] + @key[3]  # => "54", "54", "54"
    @key_c = key_a_string.to_i        # => 54, 54, 54
  end                                 # => :key_c

  def key_d
    @key = @key.map { |i| i.to_s}     # => ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"], ["3", "4", "5", "4", "6"]
    key_a_string = @key[3] + @key[4]  # => "46", "46", "46"
    @key_d = key_a_string.to_i        # => 46, 46, 46
  end                                 # => :key_d

  def key_array
    @key_array = []              # => []
    @key_array.insert(0, key_a)  # => [34]
    @key_array.insert(1, key_b)  # => [34, 45]
    @key_array.insert(2, key_c)  # => [34, 45, 54]
    @key_array.insert(3, key_d)  # => [34, 45, 54, 46]
    @key_array                   # => [34, 45, 54, 46]
  end                            # => :key_array

  def offsets_a
    @offsets_a = @offsets[0]  # => 7, 7
  end                         # => :offsets_a

  def offsets_b
    @offsets_b = @offsets[1]  # => 2, 2
  end                         # => :offsets_b

  def offsets_c
    @offsets_c = @offsets[2]  # => 2, 2
  end                         # => :offsets_c

  def offsets_d
    @offsets_d = @offsets[3]  # => 5, 5
  end                         # => :offsets_d

  def rotation
    @rotation = []                          # => []
    @rotation.insert(0, key_a + offsets_a)  # => [41]
    @rotation.insert(1, key_b + offsets_b)  # => [41, 47]
    @rotation.insert(2, key_c + offsets_c)  # => [41, 47, 56]
    @rotation.insert(3, key_d + offsets_d)  # => [41, 47, 56, 51]
    @rotation                               # => [41, 47, 56, 51]
  end                                       # => :rotation
end                                         # => :rotation

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
