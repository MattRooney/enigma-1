require_relative '../lib/crack'
require 'minitest'
require 'pry'

class CrackTests < Minitest::Test

  def test_it_returns_correct_pos
    tail = Crack.new
    assert_equal 3, tail.tail_position("abdktfd")
  end

  def test_tail_pos_set_to_corresponding_rotation
    pos = Crack.new
  end
end
