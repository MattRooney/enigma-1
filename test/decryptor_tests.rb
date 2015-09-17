require_relative '../lib/decryptor'
require 'minitest'
require 'pry'

class MessageDecryptorTests < Minitest::Test

  def test_it_takes_a_message
    message = Decrypt.new
    passed = message.decryptor(["t", "h", "i", "s", " ", "i", "s", " ", "t", "e", "x", "t", "."], [1, 1, 1, 1])
    refute_equal nil, passed
  end

  def test_it_encrypts
    message = Decrypt.new
    result = message.decryptor(["3", "2", "m", ",", "h", "3", "w", "r", "k", "s", "x", "y", "2", "b", "c"], [10, 60, 4, 98])
    assert_equal ["t", "h", "i", "s", " ", "i", "s", " ", "a", " ", "t", "e", "s", "t", "."], result
  end

end
