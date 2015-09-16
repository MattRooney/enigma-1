require_relative '../lib/encryptor'
require 'minitest'
require 'pry'

class EncryptorTests < Minitest::Test

  def test_it_generates_random
    10.times do num = Key.new
    num2 = Key.new
    refute_equal num.random_generator, num2.random_generator
  end
  end

  def test_generator_returns_five
    num = Key.new
    assert_equal 5, num.random_generator.count
  end

  def test_it_generates_five_different_keys
    key1 = Key.new
    key2 = Key.new
    key3 = Key.new
    key4 = Key.new
    key5 = Key.new
    refute_equal key1, key2
    refute_equal key2, key3
    refute_equal key3, key4
    refute_equal key4, key5
  end

  def test_key_created
    num = Key.new
    refute nil, num.random_generator
  end

  def test_it_squares_the_date
    skip #deleted method - absorbed in offsets_array
    date = Offsets.new
    assert_equal 22775337225, date.square_date!
    #will only pass on date created, remember to refactor
  end

  def test_it_offsets
    # date = Offsets.new
    # date.square_date!
    assert_equal [7, 2, 2, 5], Offsets.new.offsets_array
    #will only pass on date created, remember to refactor
  end

  def test_encryptor_has_a_key
    encryptor = Encryptor.new
    assert_equal 5, encryptor.key.count
  end

  def test_it_has_correct_offsets
    encryptor = Encryptor.new
    assert_equal [7, 2, 2, 5], encryptor.offsets
  end

  def test_the_key_index
    encryptor = Encryptor.new
    assert_equal [0, 1], encryptor.first(2)
  end
end
