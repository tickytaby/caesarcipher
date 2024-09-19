# Create the alphabet
alphabet = ("a".."z").to_a

# Create the hash
@dictionary = Hash.new(0)

# Now we want to populate the hash such that for each letter, we have a number value
alphabet.each_with_index {|x, i| @dictionary[x] = i + 1}
@inverted_dictionary = @dictionary.invert
# Now we want to encrypt the message, so we have to create the function
def cypher(string, shift)
  splitted = string.split("")
  encrypted_numbers = []
  encrypted_message = []
  
  splitted.each do |x|
    if @dictionary.key?(x)
      encrypted_numbers.push(@dictionary[x] + shift > 26? @dictionary[x] + shift - 26 : @dictionary[x] + shift)
    else
      encrypted_numbers.push(x)
    end
  end  
  encrypted_numbers.each do |x|
    if @inverted_dictionary.key?(x)
      encrypted_message.push(@inverted_dictionary[x])
    else
      encrypted_message.push(x)
    end
  end
  encrypted_message = encrypted_message.join

end

# def decypher(string, shift)
#   splitted = string.split("")
#   encrypted_numbers = []
#   encrypted_message = []
#   splitted.each do |x|
#     if @dictionary.key?(x)
#       encrypted_numbers.push(@dictionary[x] - shift < 0? @dictionary[x] - shift + 26 : @dictionary[x] - shift)
#     else
#       encrypted_numbers.push(x)
#     end
#   end  
#   encrypted_numbers.each do |x|
#     if @inverted_dictionary.key?(x)
#       encrypted_message.push(@inverted_dictionary[x])
#     else
#       encrypted_message.push(x)
#     end
#   end
#   encrypted_message = encrypted_message.join
# end


p crypted = cypher("This is a message for Caesar" , 7)
# p decypher(crypted, 7)