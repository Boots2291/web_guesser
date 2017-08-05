require 'sinatra'
require 'sinatra/reloader'

random_number = rand(101)

get '/' do
  erb :index, :locals => {:random_number => random_number}
end

