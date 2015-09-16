# require './lib/runner'
class Parser
  def initialize(message)
    @message = message
  end
  def parse_to_fours
    character_array = test_message.chars
    character_array.each_slice(4).to_a
  end
end
