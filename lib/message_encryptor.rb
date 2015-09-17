class MessageEncrypt

  def encryptor(message, rotation)
    character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',
                    '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']
    array = []
    counter = 0
    message.each do |letter|
      if !character_map.include?(letter)
        array << letter
      else
        pos_char_map = character_map.index(letter)
        array  <<   character_map[(pos_char_map + rotation[counter]) % character_map.length]
        counter = (counter + 1) % rotation.length
      end
    end
    array
  end
end


text = MessageEncrypt.new
result = text.encryptor(["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."], [10, 60, 4, 98])
result == ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"]
