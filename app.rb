require 'sinatra/base'
# require './lib/player'

class Hangman < Sinatra::Base

  get '/' do
    "Hello World"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
