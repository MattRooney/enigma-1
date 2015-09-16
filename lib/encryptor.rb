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

class Encryptor < Offsets

  def initialize
    @key     = Key.new.random_generator
    @offsets = Offsets.new.offsets_array
  end
  
  def encryption
    # set a b c and d to values of corresponding offset plus corresponding key
  end

  def original_message
    # take string of original message and seperate it by character
  end

  def encrypt_message
    # reset character values according to encryption number(s)
  end
end
