require './lib/decryptor'
require './lib/message_decryptor'

input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]
message = File.read(input_file).chomp.downcase.gsub(/["\n"]/, " ").chars
temp = Decrypt.new
rotation = temp.rotation
decrypted_chars = MessageDecrypt.new.decryptor(message, rotation)
decrypted_message = decrypted_chars.join
File.open(output_file, "w") { |file| file.write(decrypted_message)}

puts "Created #{output_file} with the key #{key} and date #{date}"
