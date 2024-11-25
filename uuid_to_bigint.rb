require "securerandom"
require "openssl"

uuid = SecureRandom.uuid.delete("-")
first_64_bits = uuid[0...16] # first 64 bits will be used as a key
second_64_bits = uuid[16...] # second 64 bits will be used as an input
puts "first_64_bits: #{first_64_bits}, second_64_bits: #{second_64_bits}"

# Hexadecimal string to binary
key = [first_64_bits].pack("H*") 
input = [second_64_bits].pack("H*")

cipher = OpenSSL::Cipher.new("DES")
# iv = cipher.random_iv
# puts "Initial Vector (Bytes): #{iv.bytes} with size: #{iv.bytesize}"

cipher.encrypt
cipher.key = key # Key must be 8 bytes for DES-ECB
# cipher.iv = iv 
encrypted_value = cipher.update(input) + cipher.final

# 64 bits unsigned integer. MySQL bigint size is 2^64 - 1
mapped_64bits_integer = encrypted_value.unpack1('Q>') 

puts "Encrypted Value (Bytes): #{encrypted_value.bytes.inspect}"
puts "Encrypted Value Length: #{encrypted_value.bytesize} bytes"
puts "Converted integer: #{mapped_64bits_integer}. It is smaller than 2^64 bits? #{mapped_64bits_integer < 2 ** 64}"

# Decrypt the encrypted value
decipher = OpenSSL::Cipher.new("DES")
decipher.decrypt 
decipher.key = key 
# decipher.iv = iv
decrypted_value = decipher.update(encrypted_value) + decipher.final

puts "Original input: #{second_64_bits}"
puts "Decrypted Value: #{decrypted_value.unpack1("H*")}"