require 'date'
require_relative 'encryptor'

input_file = ARGV[0]
output_file = ARGV[1]
date = Date.today.strftime("%d%m%y")
message = File.read(input_file)
encrypted_message = Encryptor.new
key = encrypted_message.key*""

puts "Created #{output_file} with the key #{key} and date #{date}"
