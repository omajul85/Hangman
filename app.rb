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
    @game = Game.create(word.downcase, word.length, clue)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  get '/game_over' do
    erb :game_over
  end

  post '/guess' do
    @game.guess(params[:character].downcase)
    unless @game.finished?
      redirect '/play'
    else
      redirect '/game_over'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
