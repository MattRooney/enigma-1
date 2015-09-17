require_relative '../lib/message_encrypt'
require 'minitest'
require 'pry'

class MessageEncryptorTests < Minitest::Test

  def test_it_takes_a_message
    message = MessageEncrypt.new
    passed = message.encryptor(["t", "h", "i", "s", " ", "i", "s", " ", "t", "e", "x", "t", "."], [1, 1, 1, 1])
    refute_equal nil, passed
  end

  def test_it_encrypts
    message = MessageEncrypt.new
    result = message.encryptor(["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."], [10, 60, 4, 98])
    assert_equal ["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"], result
  end

end
