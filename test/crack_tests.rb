require './lib/cracker'
require 'minitest'
require 'pry'

class CrackTests < Minitest::Test

  def test_it_returns_correct_pos
    tail = Crack.new("abdktfd")
    assert_equal 3, tail.tail_position
  end

  def test_tail_pos_set_to_corresponding_rotation
    pos = Crack.new("abdktfd")
    assert_equal 5, pos.tail_rotation
  end

  def test_neg2_pos_set_to_corresponding_rotation
    pos = Crack.new("abdktfd")
    assert_equal 7, pos.neg2_rotation
  end

  def test_neg3_pos_set_to_corresponding_rotation
    pos = Crack.new("abdktfd")
    assert_equal 16, pos.neg3_rotation
  end

  def test_neg4_pos_set_to_corresponding_rotation
    pos = Crack.new("abdktfd")
    assert_equal 36, pos.neg4_rotation
  end

  def test_charcter_map_exists
    map = Crack.new("abdktfd")
    assert_equal 39, map.character_map.size
  end

  def test_returns_correct_array
    array = Crack.new("abdktfd")
    assert_equal [16, 7, 5, 36], array.crack
  end

  def test_crack_returns_4_elemnts
    array = Crack.new("abdktfd")
    assert_equal 4, array.crack.size
  end

end
