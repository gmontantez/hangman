require 'sinatra'
require_relative 'hangman_prac.rb'

enable :sessions

get '/' do
  session[:chosen_word] = ""
  erb :choose_word
end

post "/choose_word" do
  session[:chosen_word] = params[:chosen_word]
  session[:hidden_word_array] = params[:hidden_word_array]
  session[:hidden_word_array] = lines(session[:chosen_word])
  redirect '/choose_letter'
end

get '/choose_letter' do
	puts "you are in get '/choose_letter' do and params are #{params}"
  session[:letter] = ""
  # session[:correct_guesses] = ""
  # session[:incorrect_guesses] = ""
  # session[:guess] = ""
  session[:correct_guesses] = []
  session[:incorrect_guesses] = []
  session[:guess] = []
  session[:guess] = params[:guess]
  session[:guess] = guesses(session[:chosen_word],session[:letter])
  erb :choose_letter, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array]}
end

post '/choose_letter' do
	# puts "in post '/choose_letter' do params are #{params}"
	
	# puts "in post '/choose_letter' do session are #{session.to_a}"
  session[:letter] = params[:letter]

  # puts "in post '/choose_letter' do session[:chosen_word] is #{session[:chosen_word]} and its class is #{session[:chosen_word].class} and session[:letter] is #{session[:letter]} and its class is #{session[:letter].class}"
  session[:guess] = guesses(session[:chosen_word],params[:letter])
  # session[:hidden_word_array] = params[:hidden_word_array]
  session[:correct_guesses] = params[:correct_guesses]
  session[:incorrect_guesses] = params[:incorrect_guesses]
  session[:hidden_word_array] = update_hidden_word_arr(session[:hidden_word_array], session[:chosen_word], session[:letter])
  # puts session[:hidden_word_array]
  if session[:hidden_word_array].include?("_")
  	redirect '/choose_letter'
  else
  	redirect '/results'
  end
end

get '/results' do
	puts "in get '/results' do params are #{params}"
   puts "in get '/results' do session are #{session.to_a}"
   "You Won"
   # session[:guess] = guesses(session[:chosen_word],session[:letter])
   # erb :results, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array], correct_guesses: session[:correct_guesses], incorrect_guesses: session[:incorrect_guesses]}
end


require 'sinatra'
require_relative 'hangman_prac.rb'

enable :sessions

get '/' do
  # session[:chosen_word] = ""
  erb :choose_word
end

post "/choose_word" do
  session[:chosen_word] = params[:chosen_word]
  session[:hidden_word_array] = params[:hidden_word_array]
  session[:hidden_word_array] = lines(session[:chosen_word])
  redirect '/choose_letter'
end

get '/choose_letter' do
  # session[:letter] = ""
  # session[:correct_guesses] = ""
  # session[:incorrect_guesses] = ""
  # session[:guess] = ""
  session[:correct_guesses] = []
  session[:incorrect_guesses] = []
  session[:guess] = []
  session[:guess] = params[:guess]
  session[:guess] = guesses(session[:chosen_word],session[:letter])
  erb :choose_letter, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array]}
end

post '/choose_letter' do
  session[:letter] = params[:letter]
  session[:chosen_word] = params[:chosen_word]
  session[:guess] = params[:guess]
  session[:guess] = guesses(session[:chosen_word],session[:letter])
  session[:hidden_word_array] = params[:hidden_word_array]
  session[:correct_guesses] = params[:correct_guesses]
  session[:incorrect_guesses] = params[:incorrect_guesses]

  redirect '/results'
end

get '/results' do
   session[:letter] = params[:letter]
   session[:chosen_word] = params[:chosen_word]
   session[:hidden_word_arr] = params[:hidden_word_arr]
   session[:correct_guesses] = params[:correct_guesses]
   session[:incorrect_guesses] = params[:incorrect_guesses]
   session[:guess] = params[:guess]
  session[:guess] = guesses(session[:chosen_word],session[:letter])
   erb :results, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array], correct_guesses: session[:correct_guesses], incorrect_guesses: session[:incorrect_guesses]}
end

get "/error" do
	message = "There was an error"
	redirect '/error2'
end

get "/error2" do
	puts "params are #{params}"
	my_string = params[:dood]
	my_string.each do
		puts my_string
	end

end

require "sinatra"
require_relative "hangman_prac.rb"

enable :sessions 

get '/' do
 session[:chosen_word] = ""
 erb :choose_word
end

post "/choose_word" do
 session[:chosen_word] = params[:chosen_word]
 session[:hidden_word_array] = params[:hidden_word_array]
 session[:hidden_word_array] = lines(session[:chosen_word])
 redirect '/choose_letter'
end

get '/choose_letter' do
 session[:letter] = ""
    erb :choose_letter, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array]}
end

post '/choose_letter' do
 session['counter'] ||= 0
 session[:wordupdate] = params[:wordupdate]
 session[:letter] = params[:letter]
 session[:wordupdate] = guesses(session[:chosen_word], session[:letter])
 puts "This is wordupdate #{session[:wordupdate]}"
 # session[:guess] = params[:guess]
 # session[:guess] = guesses(session[:chosen_word],session[:letter])
 # session[:chosen_word] = session[:chosen_word].split
 puts "this is #{session[:chosen_word]}!!!!!!!!!!!111"
 session['counter'] += 1
 puts "THIS IS COUNTER@@@@@@@@ #{session['counter']}"
 if session['counter'] <= 6
  session[:chosen_word].include?(session[:letter]) == true
   session[:wordupdate] = session[:chosen_word].!(session[:letter])
   session[:hidden_word_array] = lines(session[:chosen_word])
   # puts "this is wordupdate #{session[:wordupdate]}"
   redirect '/choose_letter'
 # elsif session[:chosen_word].include?(session[:letter]) == false
 #   redirect '/choose_letter'
else session['counter'] <= 6
   # || session[:chosen_word] == session[:wordupdate]
  redirect '/winner_loser'
 end
 # if session[:hidden_word_array][index] == session[:]

end
get '/winner_loser' do
 "Hello World"
end

# get '/' do
# 	session[:word] = ""
# 	session[:chosen_word] = []
# 	session[:hidden_word_array] = []
# 	erb :choose_word
# 	# p "this is the chosen_word #{chosen_word}"
# end

# post '/choose_word' do
# 	session[:word] = params[:word]
# 	session[:chosen_word] = params[:chosen_word]
# 	# session[:chosen_word] = lines(session[:word])
# 	# p session[:chosen_word]
# 	session[:hidden_word_array] = params[:hidden_word_array]
# 	session[:hidden_word_array] = lines(session[:chosen_word])
# 	# word_length.times do
# 	# 	session[:hidden_word_array] << "_"
# 	# end
# 	# session[:hidden_word_array] = lines(session[:chosen_word])
# 	redirect '/choose_letter'
# end

# get '/choose_letter' do
# 	session[:letter] = ""
# 	session[:word] = params[:word]
# 	session[:chosen_word] = params[:chosen_word]
# 	# session[:chosen_word] = word_choice(session[:word])
# 	session[:hidden_word_array] = params[:hidden_word_array]
# 	session[:hidden_word_array] = lines(session[:chosen_word])
# 	erb :choose_letter, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array]}
# end

# post '/choose_letter' do
# 	session[:letter] = params[:letter]
# 	session[:letter] = letter_guess(session[:letter])
# 	redirect '/results'
# end

# get '/results' do
# 	"Hello World"
# 	session[:correct_guesses] = []
# 	session[:incorrect_guesses] = []
# 	session[:correct_guesses] = params[:correct_guesses]
# 	session[:incorrect_guesses] = params[:incorrect_guesses]
# 	if session[:chosen_word].include?(session[:letter]) == true
# 		session[:correct_guesses] << session[:letter]

# 	else session[:chosen_word].include?(session[:letter]) == false
# 		session[:incorrect_guesses] << session[:letter]
# 	end
	
# 	erb :results, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array]}
# end

# get '/first_page' do
# 	# erb :list_of_paired_names, locals:{results: session[:paired_results], shuffled_pairs:session[:reshuffled_pairs]} 
# end

# get '/list_of_paired_names' do
# 	erb :list_of_paired_names, locals:{results: session[:paired_results], shuffled_pairs:session[:reshuffled_pairs]} 
# end

# post '/chosen_pairs' do
# 	session[:reshuffled_pairs] = []
# 	chosen_pairs = params[:chosen_pairs]
# 	p chosen_pairs
# 	if session[:paired_results].length != 0
# 		# p chosen_pairs
# 		chosen_pairs.each do |pairs|
# 			session[:pairs_array] << pairs.split(',')
# 		end
# 		# p pairs_array
# 		session[:paired_results].each do |pairs|
# 			# p pairs
# 			if session[:pairs_array].include?(pairs)
# 			else
# 				session[:reshuffled_pairs] << pairs
# 			end
# 		end
# 		session[:paired_results] = sample(session[:reshuffled_pairs].flatten)
# 		# p session[:paired_results]
# 		# p session[:reshuffled_pairs]
# 	end
# 	if session[:paired_results].length != 0
# 		redirect '/list_of_paired_names'
# 	else
# 		redirect '/list_of_all_pairs'
# 	end
# end

# get '/list_of_all_pairs' do
# 	erb :list_of_all_pairs, locals:{pairs:session[:pairs_array]}
# end
