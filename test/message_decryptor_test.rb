require './lib/message_decryptor'
require 'minitest/test'

class MessageDecryptTest < Minitest::Test
  def test_it_takes_a_message_and_rotation
    message = MessageDecrypt.new
    result = message.decryptor(["t", "h", "i", "s", " ", "i", "s",
      " ", "t", "e", "x", "t", "."], [0, 0, 0, 0])
    assert_equal ["t", "h", "i", "s", " ", "i", "s", " ", "t",
      "e", "x", "t", "."], result
  end
  def test_it_shovels_more_than_four_characters
    message = MessageDecrypt.new
    result = message.decryptor(["t", "h", "i", "s", " "], [0, 0, 0, 0])
    assert_equal 5, result.length
  end

  def test_it_shovels_every_character
    message = MessageDecrypt.new
    result = message.decryptor(["t", "h", "i", "s", " ", "i", "s",
      " ", "t", "e", "x", "t", "."], [0, 0, 0, 0])
    assert_equal 13, result.length
  end

  def test_it_rotates_in_reverse
    message = MessageDecrypt.new
    result = message.decryptor(["3", "2", "m", ",", "h", "3", "w",
      "r", "k", "s", "x", "y", "2", "b", "c"], [10, 60, 4, 98])
    assert_equal ["t", "h", "i", "s", " ", "i", "s", " ", "a",
      " ", "t", "e", "s", "t", "."], result
  end
end
