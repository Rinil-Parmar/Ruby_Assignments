# Function to encrypt a message using Caesar Cipher
def encrypt(message, key)
    encrypted_message = ""
    # Iterate through each character in the message
    message.each_char do |char|
        if char.match(/[a-zA-Z]/)
            # Calculate the shifted ASCII value using the key
            # Here .ord gives the ASCII value of the character
            shifted_ascii = char.ord + key
            shifted_ascii -= 26 if char.match(/[A-Z]/) && shifted_ascii > 'Z'.ord
            shifted_ascii -= 26 if char.match(/[a-z]/) && shifted_ascii > 'z'.ord
            encrypted_message += shifted_ascii.chr
        else
            encrypted_message += char
        end
    end
    encrypted_message
end

# Function to decrypt an encrypted message using Caesar Cipher
def decrypt(encrypted_message, key)
    decrypted_message = ""
    encrypted_message.each_char do |char|
        # Check if the character is a letter
        if char.match(/[a-zA-Z]/)
            # Calculate the shifted ASCII value using the key
            shifted_ascii = char.ord - key
            shifted_ascii += 26 if char.match(/[A-Z]/) && shifted_ascii < 'A'.ord
            shifted_ascii += 26 if char.match(/[a-z]/) && shifted_ascii < 'a'.ord
            decrypted_message += shifted_ascii.chr
        else
            decrypted_message += char
        end
    end
    decrypted_message
end

# Prompt the user to input the message, key, and mode (encrypt or decrypt)
puts "Enter the message:"
message = gets.chomp
puts "Enter the key (an integer):"
key = gets.chomp.to_i
puts "Choose mode (encrypt/decrypt):"
mode = gets.chomp.downcase

# Perform encryption or decryption based on the chosen mode
case mode
when "encrypt"
    encrypted_message = encrypt(message, key)
    puts "Encrypted message: #{encrypted_message}"
when "decrypt"
    decrypted_message = decrypt(message, key)
    puts "Decrypted message: #{decrypted_message}"
else
    puts "Invalid mode. Please choose either 'encrypt' or 'decrypt'."
end
