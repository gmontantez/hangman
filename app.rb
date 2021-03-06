require 'sinatra'
require_relative 'hangman.rb'

enable :sessions

get '/' do
  session[:chosen_word] = ""
  session[:incorrect_guesses] = []
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
  erb :choose_letter, locals:{chosen_word: session[:chosen_word], hidden_word_array: session[:hidden_word_array],incorrect_guesses: session[:incorrect_guesses]}
end

post '/choose_letter' do
  
  session[:letter] = params[:letter]
  session[:hidden_word_array] = update_hidden_word_arr(session[:hidden_word_array], session[:chosen_word], session[:letter])
  session[:incorrect_guesses] = update_incorrect_word_arr(session[:incorrect_guesses], session[:chosen_word], session[:letter])
  if session[:hidden_word_array].include?("_") && session[:incorrect_guesses].length < 13
  	redirect '/choose_letter'
  elsif session[:incorrect_guesses].length >= 13
    redirect '/losing_result'
  else 
   	redirect '/winning_result'
  end
end

get '/winning_result' do
	erb :winning_result, locals:{chosen_word: session[:chosen_word]}
end

get '/losing_result' do
  erb :losing_result, locals:{chosen_word: session[:chosen_word]}
end

get '/instructions' do
  erb :instructions
end