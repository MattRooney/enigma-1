require 'date'

input_file = ARGV[0]
output_file = ARGV[1]
date = Date.today.strftime("%d%m%y")
message = File.read(input_file)
# encrypt_message = Encryptor.new

puts "Created #{output_file} with the key #{key} and date #{date}"
