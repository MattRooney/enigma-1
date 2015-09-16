require 'date'  # => true

class Key

  attr_accessor :key  # => nil

  def initialize
    @key = key    # => nil
  end             # => :initialize

  def random_generator
    array = []           # => []
    5.times do           # => 5
      array << rand(10)  # => [7], [7, 5], [7, 5, 8], [7, 5, 8, 0], [7, 5, 8, 0, 5]
    end                  # => 5
    @key = array         # => [7, 5, 8, 0, 5]
  end                    # => :random_generator

end  # => :random_generator

class Offsets

  attr_accessor :offsets, :integer_date  # => nil

  def initialize
    @offsets = offsets            # => nil
    @integer_date = integer_date  # => nil
  end                             # => :initialize

  def offsets_array
    date = Date.today.strftime("%d%m%y")                 # => "160915"
    integer_date = date.to_i                             # => 160915
    squared_date = integer_date ** 2                     # => 25893637225
    squared_string = squared_date.to_s                   # => "25893637225"
    squared_array = squared_string.split("").map do |n|  # => ["2", "5", "8", "9", "3", "6", "3", "7", "2", "2", "5"]
      n.to_i                                             # => 2, 5, 8, 9, 3, 6, 3, 7, 2, 2, 5
    end                                                  # => [2, 5, 8, 9, 3, 6, 3, 7, 2, 2, 5]
    squared_array.last(4)                                # => [7, 2, 2, 5]
  end                                                    # => :offsets_array
end                                                      # => :offsets_array

class Encryptor < Offsets                                       # => Offsets
  Character_Map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'
                  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',' z'
                  '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']

  attr_accessor :key, :offsets, :key_a, :key_b, :key_c, :key_d  # => nil
  def initialize
    @key     = Key.new.random_generator                         # => [7, 5, 8, 0, 5]
    @offsets = Offsets.new.offsets_array                        # => [7, 2, 2, 5]
  end                                                           # => :initialize

  def key_a
    @key = @key.map { |i| i.to_s}     # => ["7", "5", "8", "0", "5"], ["7", "5", "8", "0", "5"]
    key_a_string = @key[0] + @key[1]  # => "75", "75"
    @key_a = key_a_string.to_i        # => 75, 75
  end                                 # => :key_a

  def key_b
    @key = @key.map { |i| i.to_s}     # => ["7", "5", "8", "0", "5"], ["7", "5", "8", "0", "5"]
    key_a_string = @key[1] + @key[2]  # => "58", "58"
    @key_b = key_a_string.to_i        # => 58, 58
  end                                 # => :key_b

  def key_c
    @key = @key.map { |i| i.to_s}     # => ["7", "5", "8", "0", "5"], ["7", "5", "8", "0", "5"]
    key_a_string = @key[2] + @key[3]  # => "80", "80"
    @key_c = key_a_string.to_i        # => 80, 80
  end                                 # => :key_c

  def key_d
    @key = @key.map { |i| i.to_s}     # => ["7", "5", "8", "0", "5"], ["7", "5", "8", "0", "5"]
    key_a_string = @key[3] + @key[4]  # => "05", "05"
    @key_d = key_a_string.to_i        # => 5, 5
  end                                 # => :key_d

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

  def encryption_a
    @encryption_a = key_a + offsets_a  # => 82
  end                                  # => :encryption_a

  def encryption_b
    @encryption_b = key_b + offsets_b  # => 60
  end                                  # => :encryption_b

  def encryption_c
    @encryption_c = key_c + offsets_c  # => 82
  end                                  # => :encryption_c

  def encryption_d
    @encryption_d = key_d + offsets_d  # => 10
  end                                  # => :encryption_d

  def original_message
    # take string of original message and seperate it by character
  end                   # => :original_message

  def encrypt_message
    # reset character values according to encryption number(s)
  end                  # => :encrypt_message
end                    # => :encrypt_message

value = Encryptor.new  # => #<Encryptor:0x007fb6248015b0 @key=[7, 5, 8, 0, 5], @offsets=[7, 2, 2, 5]>
value.key_a            # => 75
value.key_b            # => 58
value.key_c            # => 80
value.key_d            # => 5
value.offsets_a        # => 7
value.offsets_b        # => 2
value.offsets_c        # => 2
value.offsets_d        # => 5
value.encryption_a     # => 82
value.encryption_b     # => 60
value.encryption_c     # => 82
value.encryption_d     # => 10
