require './lib/board'
require './lib/game'
require 'rspec'

RSpec.describe Game do 
  before(:each) do 
    @game = Game.new
  end

  it 'exists' do 
    expect(@game).to be_instance_of(Game) 
  end

  it 'can print welcome message' do 
    @game.welcome_greeting
    expect(@game.has_printed_welcome).to eq(true)
  end

  it 'can start the game' do 
    @game.start
    expect(@game.has_started).to eq(true)
  end

  it 'checks if input is a valid choice' do 
    @game.turn 
    expect(@game.valid_input?('g')).to eq(true)
    expect(@game.valid_input?('z')).to eq(false)
  end
end