require 'sinatra'
require 'sinatra/reloader'

# random_number = rand(101)
set :random_number, rand(101)

def check_guess(guess)
  if guess > settings.random_number && guess - settings.random_number > 5
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

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  erb :index, :locals => {:random_number => settings.random_number,
                          :message => message}
end


