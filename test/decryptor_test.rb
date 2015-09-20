require './lib/decryptor'
require 'minitest/test'

class DecryptorTest < Minitest::Test

  def test_it_takes_a_key
    ARGV[2] = "12345"
    decryption = Decrypt.new
    assert_equal 5, decryption.key.length
  end

  def test_creates_key_a
    ARGV[2] = "12345"
    key = Decrypt.new
    assert_equal 12, key.key_a
  end

  def test_creates_key_b
    ARGV[2] = "12345"
    key = Decrypt.new
    assert_equal 23, key.key_b
  end

  def test_creates_key_c
    ARGV[2] = "12345"
    key = Decrypt.new
    assert_equal 34, key.key_c
  end

  def test_creates_key_d
    ARGV[2] = "12345"
    key = Decrypt.new
    assert_equal 45, key.key_d
  end

  def test_creates_key_array
    ARGV[2] = "12345"
    array = Decrypt.new
    assert_equal [12, 23, 34, 45], array.key_array
  end

  def test_offests_set
    ARGV[2] = "12345"
    array = Decrypt.new
    assert_equal 4, array.offsets.length
  end

  def test_offests_a_set
    ARGV[2] = "12345"
    offset = Decrypt.new
    assert_equal 7, offset.offsets_a
  end

  def test_offests_b_set
    ARGV[2] = "12345"
    offset = Decrypt.new
    assert_equal 2, offset.offsets_b
  end

  def test_offests_c_set
    ARGV[2] = "12345"
    offset = Decrypt.new
    assert_equal 2, offset.offsets_c
  end

  def test_offests_d_set
    ARGV[2] = "12345"
    offset = Decrypt.new
    assert_equal 5, offset.offsets_d
  end

  def test_rotation_correcty_set
    ARGV[2] = "12345"
    rotation = Decrypt.new
    assert_equal [19, 25, 36, 50], rotation.rotation
  end

end
