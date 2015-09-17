class MessageEncrypt

  def encryptor(message, rotation)
    character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',         # => "m"
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',           # => "z"
                    '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']            # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    array = []                                                                                # => []
    counter = 0                                                                               # => 0
    message.each do |letter|                                                                  # => ["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."]
      if !character_map.include?(letter)                                                      # => false, false, false, false, false, false, false, false, false, false, false, false, false, false, false
        array << letter
      else
        pos_char_map = character_map.index(letter)                                            # => 19, 7, 8, 18, 36, 8, 18, 36, 0, 36, 19, 4, 18, 19, 37
        array  <<   character_map[(pos_char_map + rotation[counter]) % character_map.length]  # => ["3"], ["3", "2"], ["3", "2", "m"], ["3", "2", "m", ","], ["3", "2", "m", ",", "h"], ["3", "2", "m", ",", "h", "3"], ["3", "2", "m", ",", "h", "3", "w"], ["3", "2", "m", ",", "h", "3", "w", "r"], ["3", "2", "m", ",", "h", "3", "w", "r", "k"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b"], ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"]
        counter = (counter + 1) % rotation.length                                             # => 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3
      end                                                                                     # => 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 3
    end                                                                                       # => ["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."]
    array                                                                                     # => ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"]
  end                                                                                         # => :encryptor
end                                                                                           # => :encryptor


text = MessageEncrypt.new                                                                                              # => #<MessageEncrypt:0x007feb0500ca38>
result = text.encryptor(["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."], [10, 60, 4, 98])  # => ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"]
result == ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"]                                  # => true
