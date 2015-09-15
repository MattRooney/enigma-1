Character_Map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm'
                 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',' z'
                 '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']

class Key
  def initialize(key)
    @key = key
  end

  def random_generator
    #generate random five digit key
  end

  def key
    #a is first two digits, b is two and three, c is three and four, d is four and five
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
