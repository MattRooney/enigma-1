class MessageEncrypt

  def encryptor(message, rotation)
    character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',         # => "m"
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',           # => "z"
                    '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']            # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    array = []                                                                                # => []
    counter = 0                                                                               # => 0
    message.map do |letter|                                                                   # => ["m", "e", "s", "s", "a", "g", "e"]
      if !character_map.include?(letter)                                                      # => false, false, false, false, false, false, false
        array << letter
      else
        pos_char_map = character_map.index(letter)                                            # => 12, 4, 18, 18, 0, 6, 4
        array  <<   character_map[(pos_char_map + rotation[counter]) % character_map.length]  # => ["w"], ["w", "z"], ["w", "z", "w"], ["w", "z", "w", ","], ["w", "z", "w", ",", "k"], ["w", "z", "w", ",", "k", "1"], ["w", "z", "w", ",", "k", "1", "i"]
        counter = (counter + 1) % rotation.length                                             # => 1, 2, 3, 0, 1, 2, 3
      end                                                                                     # => 1, 2, 3, 0, 1, 2, 3
    end                                                                                       # => [1, 2, 3, 0, 1, 2, 3]
    array                                                                                     # => ["w", "z", "w", ",", "k", "1", "i"]
  end                                                                                         # => :encryptor
end                                                                                           # => :encryptor

encrypt = MessageEncrypt.new.encryptor(["m", "e", "s", "s", "a", "g", "e"],[10, 60, 4, 98])  # => ["w", "z", "w", ",", "k", "1", "i"]
encrypt                                                                                      # => ["w", "z", "w", ",", "k", "1", "i"]
