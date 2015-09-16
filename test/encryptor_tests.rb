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

  # def test_it_squares_the_date
  #   skip #deleted method - absorbed in offsets_array
  #   date = Offsets.new
  #   assert_equal 22775337225, date.square_date!
  #   #will only pass on date created, remember to refactor
  # end

  def test_it_offsets
    assert_equal [7, 2, 2, 5], Offsets.new.offsets_array
  end

  def test_encryptor_has_a_key
    encryptor = Encryptor.new
    assert_equal 5, encryptor.key.count
  end

  def test_it_has_correct_offsets
    encryptor = Encryptor.new
    assert_equal [7, 2, 2, 5], encryptor.offsets
  end

  def test_it_has_a_unique_key_a
    encryptor1 = Encryptor.new
    encryptor2 = Encryptor.new
    encryptor3 = Encryptor.new
    refute_equal encryptor1.key_a, encryptor2.key_a
    refute_equal encryptor2.key_a, encryptor3.key_a
    refute_equal encryptor1.key_a, encryptor3.key_a
  end

  def test_key_map_has_five_elements
    encryptor = Encryptor.new
    encryptor.key_a
    assert_equal 5, encryptor.key.count
  end

  def test_key_a_is_fixnum
    encryptor = Encryptor.new
    assert_equal Fixnum, encryptor.key_a.class
  end

  def test_key_b_is_fixnum
    encryptor = Encryptor.new
    assert_equal Fixnum, encryptor.key_b.class
  end

  def test_key_c_is_fixnum
    encryptor = Encryptor.new
    assert_equal Fixnum, encryptor.key_c.class
  end

  def test_key_d_is_fixnum
    encryptor = Encryptor.new
    assert_equal Fixnum, encryptor.key_d.class
  end

  def test_offsets_a_is_correct
    encryptor = Encryptor.new
    assert_equal Offsets.new.offsets_array[0], encryptor.offsets_a
  end

  def test_offsets_b_is_correct
    encryptor = Encryptor.new
    assert_equal Offsets.new.offsets_array[1], encryptor.offsets_b
  end

  def test_offsets_c_is_correct
    encryptor = Encryptor.new
    assert_equal Offsets.new.offsets_array[2], encryptor.offsets_c
  end

  def test_offsets_d_is_correct
    encryptor = Encryptor.new
    assert_equal Offsets.new.offsets_array[3], encryptor.offsets_d
  end

  def test_encryption_a_equals_key_a_plus_offsets_a
    encryptor = Encryptor.new
    assert_equal (encryptor.key_a) + (encryptor.offsets_a),
      encryptor.encryption_a
  end

  def test_encryption_b_equals_key_b_plus_offsets_b
    encryptor = Encryptor.new
    assert_equal (encryptor.key_b) + (encryptor.offsets_b),
      encryptor.encryption_b
  end

  def test_encryption_c_equals_key_c_plus_offsets_c
    encryptor = Encryptor.new
    assert_equal (encryptor.key_c) + (encryptor.offsets_c),
      encryptor.encryption_c
  end

  def test_encryption_d_equals_key_d_plus_offsets_d
    encryptor = Encryptor.new
    assert_equal (encryptor.key_d) + (encryptor.offsets_d),
      encryptor.encryption_d
  end
end
