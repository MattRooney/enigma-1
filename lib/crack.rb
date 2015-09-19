require_relative 'decryptor'
require 'date'
require 'pry'

class Crack

  attr_accessor :character_map, :message

  def initialize(message)
    @message = message
  end

  def character_map
    @character_map = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
                      'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y','z',
                      '0', '1', '2', '3', '4', '5', '6', '7','8','9', ' ', '.', ',']
  end

  def tail_position
    remainder = message.length % 4
  end

  def tail_rotation
    pos_char_map = character_map.index(message[-1])
    @tail_rotation = (pos_char_map - character_map.index('.')) % character_map.length
  end

  def neg2_rotation
    pos_char_map = character_map.index(message[-2])
    @neg2_rotation = (pos_char_map - character_map.index('.')) % character_map.length
  end

  def neg3_rotation
    pos_char_map = character_map.index(message[-3])
    @neg3_rotation = (pos_char_map - character_map.index('d')) % character_map.length
  end

  def neg4_rotation
    pos_char_map = character_map.index(message[-4])
    @neg4_rotation = (pos_char_map - character_map.index('n')) % character_map.length
  end

  def crack
    @crack = []
    if tail_position == 0
      @crack << neg4_rotation << neg3_rotation << neg2_rotation << tail_rotation
    elsif tail_position == 1
      @crack << tail_rotation << neg4_rotation << neg3_rotation << neg2_rotation
    elsif tail_position == 2
      @crack << neg2_rotation << tail_rotation << neg4_rotation << neg3_rotation
    elsif tail_position == 3
      @crack << neg3_rotation << neg2_rotation << tail_rotation << neg4_rotation
    end
      @crack
  end
end


input_file = ARGV[0]
output_file = ARGV[1]
message = File.read(input_file).chomp.downcase.chars
crack = Crack.new(message)
rotation = crack.crack
cracked_new = Decrypt.new
cracked_message = cracked_new.decryptor(message, rotation)
cracked = cracked_message.join
File.open(output_file, "w") { |file| file.write(cracked)}

puts "Created #{output_file} with encryption #{rotation}"
