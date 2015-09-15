require_relative '../lib/encryptor'  # => true
require 'minitest'                   # => true
require 'pry'                        # => true

class EncryptorTests < Minitest::Test  # => Minitest::Test

  def test_it_generates_random
    10.times do num = Key.new
    num2 = Key.new
    refute_equal num.random_generator, num2.random_generator
  end
  end                                                         # => :test_it_generates_random

  def test_generator_returns_five
    num = Key.new
    assert_equal 5, num.random_generator.count
  end                                           # => :test_generator_returns_five

  def test_key_created
    num = Key.new
    assert_equal num.key, num.random_generator
  end                                        # => :test_key_created
end                                          # => :test_key_created
