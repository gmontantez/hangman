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

