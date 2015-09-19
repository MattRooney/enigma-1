require_relative 'decryptor'  # => true

class Crack

  attr_accessor :crack_a, :crack_b, :crack_c, :crack_d, :character_map, :message  # => nil

  def initialize(message)
    @message = message     # => "iza.pewqpewq"
  end                      # => :initialize

  def character_map
    @character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',   # => "m", "m", "m", "m", "m", "m", "m", "m", "m", "m", "m", "m"
                        'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',  # => "z", "z", "z", "z", "z", "z", "z", "z", "z", "z", "z", "z"
                        '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']   # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w",...
  end                                                                                    # => :character_map

  def tail_position
    remainder = message.length % 4  # => 0
  end                               # => :tail_position

  def tail_rotation
    message[-1].chars.map do |letter|                                                  # => ["q"]
    pos_char_map = character_map.index(letter)                                         # => 16
    @tail_rotation = (pos_char_map - character_map.index('.')) % character_map.length  # => 18
    end                                                                                # => [18]
  end                                                                                  # => :tail_rotation

  def neg2_rotation
    message[-2].chars.map do |letter|                                                  # => ["w"]
    pos_char_map = character_map.index(letter)                                         # => 22
    @neg2_rotation = (pos_char_map - character_map.index('.')) % character_map.length  # => 24
    end                                                                                # => [24]
  end                                                                                  # => :neg2_rotation

  def neg3_rotation
    message[-3].chars.map do |letter|                                                  # => ["e"]
    pos_char_map = character_map.index(letter)                                         # => 4
    @neg3_rotation = (pos_char_map - character_map.index('d')) % character_map.length  # => 1
    end                                                                                # => [1]
  end                                                                                  # => :neg3_rotation

  def neg4_rotation
    message[-4].chars.map do |letter|                                                  # => ["p"]
    pos_char_map = character_map.index(letter)                                         # => 15
    @neg4_rotation = (pos_char_map - character_map.index('n')) % character_map.length  # => 2
    end                                                                                # => [2]
  end                                                                                  # => :neg4_rotation

  # def unordered_array
  #   unordered_array = []
  #   unordered_array << @neg4_rotation
  #   unordered_array << @neg3_rotation
  #   unordered_array << @neg2_rotation
  #   unordered_array << @tail_rotation
  # end

  def crack
    crack = []                                                                       # => []
    if tail_position == 0                                                            # => true
      crack << @neg4_rotation << @neg3_rotation << @neg2_rotation << @tail_rotation  # => [2, 1, 24, 18]
    elsif tail_position == 1
      crack << @tail_rotation << @neg4_rotation << @neg3_rotation << @neg2_rotation
    elsif tail_position == 2
      crack << @neg2_rotation << @tail_rotation << @neg4_rotation << @neg3_rotation
    elsif tail_position == 3
      crack << @neg3_rotation << @neg2_rotation << @tail_rotation << @neg4_rotation
    end                                                                              # => [2, 1, 24, 18]
  end                                                                                # => :crack


end  # => :crack

array = Crack.new("iza.pewqpewq")  # => #<Crack:0x007f7fe2806ab0 @message="iza.pewqpewq">
array.tail_rotation                # => [18]
array.neg2_rotation                # => [24]
array.neg3_rotation                # => [1]
array.neg4_rotation                # => [2]
array.crack                        # => [2, 1, 24, 18]
