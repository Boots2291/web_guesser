require 'sinatra'
require 'sinatra/reloader'

# random_number = rand(101)
set :random_number, rand(101)

def check_guess(guess)
  if guess == 0
    ""
  elsif guess > settings.random_number && guess - settings.random_number > 5
    "Way to high!"
  elsif guess > settings.random_number
    "Too high!"
  elsif guess < settings.random_number && settings.random_number - guess > 5
    "Way to low!"
  elsif guess < settings.random_number
    "Too low!"
  elsif guess == settings.random_number
    "You got it right!"
  end
end

def background(message)
  case message
  when "Way to high!"
    "#ff2828"
  when "Way to low!"
    "#ff2828"
  when "Too high!"
    "#ff7777"
  when "Too low!"
    "#ff7777"
  when "You got it right!"
    "#48ff42"
  else
    "white"
  end
end

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  background = background(message)
  erb :index, :locals => {:random_number => settings.random_number,
                          :message => message,
                          :background => background}
end


