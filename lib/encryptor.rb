require 'date'  # => true

class Key

  attr_accessor :key  # => nil

  def initialize
    @key = key
  end             # => :initialize

  def random_generator
    array = []
    5.times do
      array << rand(10)
    end
    @key = array
  end                    # => :random_generator

end  # => :random_generator

class Offsets

  attr_accessor :offsets, :integer_date  # => nil

  def initialize
    @offsets = offsets
    @integer_date = integer_date
  end                             # => :initialize

  def offsets_array
    date = Date.today.strftime("%d%m%y")
    integer_date = date.to_i
    squared_date = integer_date ** 2
    squared_string = squared_date.to_s
    squared_array = squared_string.split("").map do |n|
      n.to_i
    end
    squared_array.last(4)
  end                                                    # => :offsets_array
end                                                      # => :offsets_array

class Encryptor < Offsets                 # => Offsets
  attr_accessor :key, :offsets            # => nil
  def initialize
    @key     = Key.new.random_generator
    @offsets = Offsets.new.offsets_array
  end                                     # => :initialize

  def encryption_a
    @key.first(2)
    @offsets[0]
    # set a b c and d to values of corresponding offset plus corresponding key
  end             # => :encryption

  def original_message
    # take string of original message and seperate it by character
  end                   # => :original_message

  def encrypt_message
    # reset character values according to encryption number(s)
  end                  # => :encrypt_message
end                    # => :encrypt_message
