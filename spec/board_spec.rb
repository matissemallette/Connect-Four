require 'RSpec'
require './lib/board'
require './lib/cell'

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
		board2 = @board
		board2.populate_board
		expect(board2.contents[0][0]).to be_an_instance_of(Cell)
	end

  it 'can render contents' do
		@board.populate_board
		# @board.render
	end

	it 'can check contents of cell' do
		board2 = @board 
		board2.populate_board 
		board2.contents[2][2].content = 'X'
		# board2.render
		expect(board2.is_occupied?(2, 2)).to eq(true)
	end

	it 'can have chips dropped in it' do
		board2 = @board
		board2.populate_board
		board2.drop('A', 'X')
		board2.drop('C', 'X')
		board2.render
		expect(board2.contents[5][0].content).to eq('X')
	end

	it 'tells us if board is full' do
    board2 = @board
		board2.populate_board
    6.times do
      board2.drop('a', 'O')
      board2.drop('b', 'O')
      board2.drop('c', 'O')
      board2.drop('d', 'O')
      board2.drop('e', 'O')
      board2.drop('f', 'O')
      board2.drop('g', 'O')
    end
    expect(board2.is_full?).to eq(true)
  end
end