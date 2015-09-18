require './lib/encryptor'
require './lib/message_encryptor'
require 'date'
require 'pry'

input_file = ARGV[0]
output_file = ARGV[1]
date = Date.today.strftime("%d%m%y")
message = File.read(input_file).chomp.downcase.chars
temp = Encryptor.new
rotation = temp.rotation
key = temp.key.join
encrypted_chars = MessageEncrypt.new.encryptor(message, rotation)
encrypted_message = encrypted_chars.join
File.open(output_file, "w") { |file| file.write(encrypted_message)}

puts "Created #{output_file} with the key #{key} and date #{date}"
