require 'rspec'
require './lib/board'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do 
    expect(@board).to be_an_instance_of(Board)
  end

  it 'has contents' do
    expect(@board.contents).to be_an_instance_of(Array)
  end

	it 'can populate board' do
		@board.populate_board
		expect(@board.contents[4][4]).to eq('.')
	end

  it 'can render contents' do
		@board.render
		expect(@board.can_render).to eq(true)
	end

	it 'can check contents of cell' do
		@board.contents[2][2] = 'X'
		expect(@board.is_occupied?(2, 2)).to eq(true)
	end

	it 'can have chips dropped in it' do
		@board.populate_board
		@board.drop('A', 'X')
		@board.drop('C', 'X')
		expect(@board.contents[5][0]).to eq('X')
	end

	it 'has letter-to-column helper method' do
		expect(@board.letter_to_column('a')).to eq(0)
		expect(@board.letter_to_column('b')).to eq(1)
		expect(@board.letter_to_column('g')).to eq(6)
		expect(@board.letter_to_column('x')).to eq(0)
	end

	it 'tells us if board is full' do
		@board.populate_board
    6.times do
			['a','b','c','d','e','f','g'].each {|column| @board.drop(column, 'O')}
    end
    expect(@board.is_full?).to eq(true)
		@board.populate_board
		expect(@board.is_full?).to eq(false)
  end
end