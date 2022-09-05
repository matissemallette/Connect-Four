require 'rspec'
require './lib/board'
require './lib/logic'


RSpec.describe Logic do 
  before(:each) do 
    @logic = Logic.new
  end
  it 'exists' do 
    expect(@logic).to be_instance_of Logic
  end

  it 'will detect a horizontal win' do 
    board = Board.new
    board.populate_board
    board.drop('a', 'x')
    board.drop('b', 'x')
    board.drop('c', 'x')
    board.drop('d', 'x')
    board.render

    expect(@logic.horizontal_win(board, 'x')).to eq(true)

    board2 = Board.new
    board2.populate_board
    board2.drop('a', 'x')
    board2.drop('c', 'x')
    board2.drop('e', 'x')
    board2.drop('g', 'x')

    expect(@logic.horizontal_win(board2, 'x')).to eq(false)
  end 

  it 'will detect a vertical win' do 
    board = Board.new
    board.populate_board
    board.drop('a', 'x')
    board.drop('a', 'x')
    board.drop('a', 'x')
    board.drop('a', 'x')
    board.render

    expect(@logic.vertical_win(board, 'x')).to eq(true)

    board2 = Board.new
    board2.populate_board
    board2.drop('a', 'x')
    board2.drop('b', 'x')
    board2.drop('b', 'x')
    board2.drop('a', 'x')
    board2.render

    expect(@logic.vertical_win(board2, 'x')).to eq(false)
  end

  it 'can detect if robot wins veritcally' do 
    board = Board.new
    board.populate_board
    board.drop('a', 'o')
    board.drop('a', 'o')
    board.drop('a', 'o')
    board.drop('a', 'o')
    board.render

    expect(@logic.vertical_win(board, 'o')).to eq(true)
  end

  it 'can detect if robot wins horizontally' do 
    board = Board.new
    board.populate_board
    board.drop('a', 'o')
    board.drop('b', 'o')
    board.drop('c', 'o')
    board.drop('d', 'o')
    board.render

    expect(@logic.horizontal_win(board, 'o')).to eq(true)
  end
end