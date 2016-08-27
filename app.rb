require 'sinatra/base'
require './lib/game'
require './views/helpers/view_helpers.rb'

class Hangman < Sinatra::Base

  include ViewHelpers

  enable :sessions

  # This is a sinatra filter (@game is used in every route)
  before do
    @game = Game.instance
  end

  get '/' do
    erb :start_game
  end

  post '/game_data' do
    word = params[:word]
    clue = params[:clue]
    @game = Game.create(word, word.length, clue)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
