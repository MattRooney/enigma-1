require './lib/cracker'
require './lib/message_decryptor'

input_file = ARGV[0]
output_file = ARGV[1]
message = File.read(input_file).chomp.downcase.gsub(/["\n"]/, " ").chars
crack = Crack.new(message)
rotation = crack.crack
cracked_new = MessageDecrypt.new
cracked_message = cracked_new.decryptor(message, rotation)
cracked = cracked_message.join
File.open(output_file, "w") { |file| file.write(cracked)}

puts "Created #{output_file} with encryption #{rotation}"
