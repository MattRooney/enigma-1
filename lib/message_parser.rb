# require './lib/runner'
class Parser
  attr_accessor :message

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
