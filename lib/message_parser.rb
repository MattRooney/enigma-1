# require './lib/runner'
class Parser
  attr_accessor :message
<<<<<<< HEAD
=======

>>>>>>> c273545f305f3f7cf5bb0dfe6a6606b0f7a207a3
  def initialize(message)
    @message = message
  end

  def parse_to_fours
    characters = @message.chars
    @message = characters.each_slice(4).to_a
  end
end

message = Parser.new "This is a test. Words and stuff."
message.parse_to_fours
