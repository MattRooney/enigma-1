class Decrypt

  def decryptor(message, rotation)
    character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',         # => "m"
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',           # => "z"
                    '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']            # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    array = []                                                                                # => []
    counter = 0                                                                               # => 0
    message.map do |letter|                                                                   # => ["a", "b", "c", "d", "e"]
      if !character_map.include?(letter)                                                      # => false, false, false, false, false
        array << letter
      else
        pos_char_map = character_map.index(letter)                                            # => 0, 1, 2, 3, 4
        array  <<   character_map[(pos_char_map - rotation[counter]) % character_map.length]  # => ["1"], ["1", "a"], ["1", "a", "b"], ["1", "a", "b", "c"], ["1", "a", "b", "c", "5"]
        counter = (counter + 1) % rotation.length                                             # => 1, 2, 3, 0, 1
      end                                                                                     # => 1, 2, 3, 0, 1
    end                                                                                       # => [1, 2, 3, 0, 1]
    array                                                                                     # => ["1", "a", "b", "c", "5"]
  end                                                                                         # => :decryptor
end                                                                                           # => :decryptor

result = Decrypt.new                                                    # => #<Decrypt:0x007ff85502bd18>
decrypted = result.decryptor(['a', 'b', 'c', 'd', 'e'], [12, 1, 1, 1])  # => ["1", "a", "b", "c", "5"]
