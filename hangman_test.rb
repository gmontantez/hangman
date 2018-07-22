require 'minitest/autorun'
require_relative 'hangman.rb'

class Hangman_test < Minitest::Test
	def test_convert_air_to_hidden_array
  		word = "air"
   		assert_equal(["_", "_", "_"], lines(word))
 	end

    def test_convert_hangman_to_hidden_array
        word = "hangman"
        assert_equal(["_", "_", "_", "_", "_", "_", "_"], lines(word))
    end

    def test_convert_to_hidden_array_capital_letters
        word = "HANGMAN"
        assert_equal(["_", "_", "_", "_", "_", "_", "_"], lines(word))
    end

    def test_a_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "a" 
        assert_equal(["a", "_", "_"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_i_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "i" 
        assert_equal(["_", "i", "_"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_r_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "r" 
        assert_equal(["_", "_", "r"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_capitall_a_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "A" 
        assert_equal(["a", "_", "_"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_capital_i_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "I" 
        assert_equal(["_", "i", "_"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_capital_r_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "R" 
        assert_equal(["_", "_", "r"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_incorrect_letter_z_in_air
        word = "air"
        hidden_word_arr = ["_", "_", "_"]
        letter = "z" 
        assert_equal(["_", "_", "_"], update_hidden_word_arr(hidden_word_arr,word,letter))
    end

    def test_incorrect_letter_q_in_air_incorrect_guesses_function 
        word = "air"
        incorrect_guesses = ["_", "_", "_"]
        letter = "q" 
        assert_equal(["_", "_", "_", "q"], update_incorrect_word_arr(incorrect_guesses,word,letter))
    end

    def test_correct_letter_c_in_cat_incorrect_guesses_function
        word = "cat"
        incorrect_guesses = ["_", "_", "_"]
        letter = "c" 
        assert_equal( ["_", "_", "_"], update_incorrect_word_arr(incorrect_guesses,word,letter))
    end
end