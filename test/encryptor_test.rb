require './lib/encryptor'
require 'minitest/test'

class EncryptorTest < Minitest::Test

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

  def test_key_created
    num = Key.new
    refute nil, num.random_generator
  end

  def test_it_generates_ten_different_keys
    10.times do key1 = Key.new
    key2 = Key.new
    refute_equal key1, key2
    end
  end

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
    10.times do encryptor1 = Encryptor.new
    encryptor2 = Encryptor.new
    refute_equal encryptor1.key_a, encryptor2.key_a
    end
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

  def test_it_has_a_rotation
    encryptor = Encryptor.new
    assert encryptor.rotation
  end

  def test_rotation_has_all_four_rotations
    encryptor = Encryptor.new
    assert_equal 4, encryptor.rotation.size
  end

  def test_it_has_a_unique_rotation
    10.times do encryptor1 = Encryptor.new
    encryptor2 = Encryptor.new
    refute_equal encryptor1, encryptor2
    end
  end
end
