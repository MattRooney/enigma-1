

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
  def date_format
    # ddmmyy
  end

  def square_date
    #square date_format and output last four digits to an array
  end

  def offsets
    #set offsets equal to corresponding square_date array index
  end
end

class Encryptor
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
