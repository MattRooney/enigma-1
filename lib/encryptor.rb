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
  Character_Map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',' z',
                  '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']

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

  def encryption_a
    @encryption_a = key_a + offsets_a
  end

  def encryption_b
    @encryption_b = key_b + offsets_b
  end

  def encryption_c
    @encryption_c = key_c + offsets_c
  end

  def encryption_d
    @encryption_d = key_d + offsets_d
  end

  def original_message
    # take string of original message and seperate it by character
  end

  def encrypt_message
    # reset character values according to encryption number(s)
  end
end

value = Encryptor.new
value.key_a
value.key_b
value.key_c
value.key_d
value.offsets_a
value.offsets_b
value.offsets_c
value.offsets_d
value.encryption_a
value.encryption_b
value.encryption_c
value.encryption_d
