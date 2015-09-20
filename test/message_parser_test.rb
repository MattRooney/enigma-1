# require_relative '../lib/message_parser'
# require 'minitest'
# require 'pry'
#
# class ParserTests < Minitest::Test
#
# def test_it_takes_a_message
#   text = Parser.new("Some words here.")
#   assert_equal "Some words here.", text.message
# end
#
#   def  test_splits_array_into_groups_of_four
#     message = Parser.new "This is a test."
#     assert_equal [["T", "h", "i", "s"], [" ", "i", "s", " "], ["a", " ", "t", "e"], ["s", "t", "."]],
#       message.parse_to_fours
#   end
#
# end
