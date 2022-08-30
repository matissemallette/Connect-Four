require './lib/board'
require './lib/cell'
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
    game2 = Game.new 
    game2.welcome_greeting
    expect(game2.has_printed_welcome).to eq(true)
  end

  it 'can start the game' do 
    game2 = Game.new
    game2.start
    expect(game2.running).to eq(true)
  end
end