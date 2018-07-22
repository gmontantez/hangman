def game(word,letter)
  str = []
    letter_array = []
    trashcan = []
    new_array = []
    result = ""
    chosen_word = word.split(//)
      if chosen_word.include?(letter) == true
          result = true
      else chosen_word.include?(letter) == false
          result = false
      end
    result
end

def lines(word)
    hidden_word_array = []
    word_length = word.length
    # chosen_word = word.split(//)
    p "this is word_length #{word_length}"
    word_length.times do 
      hidden_word_array << "_"
    end
    hidden_word_array
end

def guesses(word,letter)
  incorrect_guesses = []
  hidden_word_arr = lines(word)
  p hidden_word_arr
  chosen_word = word.split(//)
  p chosen_word
  chosen_word.each_with_index do |cw_letter,index|
    if letter == cw_letter
      hidden_word_arr[index] = letter
      hidden_word_arr
      p hidden_word_arr
    else 
      chosen_word.include?(letter) == false
      incorrect_guesses << letter
      # p incorrect_guesses
    end
  end

end 
  
# def word_choice(word)
#     word
#     # p word
# end

# def lines(word)
#     hidden_word_array = []
#     word_length = word.length
#     chosen_word = word.split(//)

#     # # p "this is word_length #{word_length}"
#     word_length.times do 
#       hidden_word_array << "_"
#     end
#     hidden_word_array
#     # p hidden_word_array
#     # if chosen_word.include?(letter) == true
#     #   correct_letter(letter)
#     # else chosen_word.include?(letter) == false
#     #   wrong_letter(letter)
#     # end
#     # letter

# end

# def letter_guess(letter)
#     letter
#     # correct_guesses = []
#     # correct_guesses << letter
#     # p letter
#     # p correct_guesses
# end

# def wrong_letter(letter)
#     letter
#     # incorrect_guesses = []
#     # incorrect_guesses << letter
#     # p letter
#     # p incorrect_guesses
# end



 # lines("hangman")
 # lines("hangman","o")

# alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", 
# "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]


# def game(word,letter)
#     result = ""
#     chosen_word = word.split(//)
#       if chosen_word.include?(letter) == true
#           result = true
#       else chosen_word.include?(letter) == false
#           result = false
#       end
#     result
# end



# lines("hangman")
# guesses("hangman","g") 
# guesses("hangman","o")
# chosen_letters("hangman","a")
# chosen_letters("hangman","m")
# chosen_letters("hangman","v")

# p incorrect_letter("o") 

# lines("hangman")
# guesses("hangman","a")  


# def game(word,letter)
#   str = []
#       letter_array = []
#       trashcan = []
#       new_array = []
#       result = ""
#       chosen_word = word.split(//)
#       if chosen_word.include?(letter) == true
#               result = true
#       else chosen_word.include?(letter) == false
#               result = false
#       end
#     result
# end

# def lines(word)
#       hidden_word_array = []
#       word_length = word.length
#       # chosen_word = word.split(//)
#       p "this is word_length #{word_length}"
#       word_length.times do 
#       hidden_word_array << "_"
#       end
#       hidden_word_array
# end

# def guesses(word,letter)
#   incorrect_guesses = []
#   hidden_word_arr = lines(word)
#   # p hidden_word_arr
#   chosen_word = word.split(//)
#   # p chosen_word
#   chosen_word.each_with_index do |cw_letter,index|
#       if letter == cw_letter
#           hidden_word_arr[index] = letter
#           hidden_word_arr
#           # p hidden_word_arr
#       else 
#           chosen_word.include?(letter) == false
#           incorrect_guesses << letter
#           # p incorrect_guesses
#       end
#   end

# end 
  


# # lines("hangman")
# # guesses("hangman","a")  


# def game(word,letter)
#     str = []
#       letter_array = []
#       trashcan = []
#       new_array = []
#       result = ""
#       chosen_word = word.split(//)
#         if chosen_word.include?(letter) == true
#               result = true
#         else chosen_word.include?(letter) == false
#               result = false
#         end
#     result
# end

def lines(word)
     hidden_word_array = []
     word_length = word.length
     # chosen_word = word.split(//)
     p "this is word_length #{word_length}"
     word_length.times do
       hidden_word_array << "_"
     end
     hidden_word_array
end

# def remove_lines(word,letter)
#     remove_lines_array = []
#     updateword = ""
#   hidden_word_arr = lines(word)
#     p "this is hidden_word_arr before if #{hidden_word_arr}"
#     chosen_word = word.split(//)
#     if chosen_word.include?(letter) == true
#         word = word.delete!(letter)
#         hidden_word_arr = lines(word)
#         p "this is hidden_word_arr after if #{hidden_word_arr}"
#         #
#          # updateword = word - letter
#          p "this is word #{word}"
#      else
#          p"this letter is not included!, try again!!!"
#      end
# end

def guesses(word,letter)
    puts "in guesses(#{word},#{letter})"
    correct_guesses = []
    incorrect_guesses = []
    # p letter
    # hidden_word_array = lines(word)
    # p hidden_word_arr
    # chosen_word = word.split(//)
    # p chosen_word
    # chosen_word.each_with_index do |cw_letter,index|
    #     p chosen_word
    #     if letter == cw_letter
    #         hidden_word_arr[index] = letter
    #         hidden_word_arr
    #         p hidden_word_arr
    #     else
    #         chosen_word.include?(letter) == false
    #         incorrect_guesses << letter
    #         # p incorrect_guesses
    #     end
    # end
    if word.include?(letter) == false
        incorrect_guesses << letter
        p incorrect_guesses
    else word.include?(letter) == true
        correct_guesses << letter
        p correct_guesses
    end


end

def update_hidden_word_arr(hidden_word_arr, word, letter)
    counter = 0
    word.split("").each do |word_letter|
        if word_letter == letter
            hidden_word_arr[counter] = letter
        end
        counter += 1
    end
    hidden_word_arr

end




# p guesses("hangman","s")
# p guesses("hangman","m")