require 'rspec'
require './lib/board'
require './lib/logic'


RSpec.describe Logic do 
  before(:each) do 
    @logic = Logic.new
    @board = Board.new
  end
  it 'exists' do 
    expect(@logic).to be_instance_of Logic
  end

  it 'will detect a horizontal win' do 
    @board.populate_board
    ['a', 'b', 'c', 'd'].each {|column| @board.drop(column, 'x')}
  
    @board.render

    expect(@logic.horizontal_win(@board, 'x')).to eq(true)

    
    @board.populate_board
    ['a', 'c', 'e', 'g'].each {|column| @board.drop(column, 'x')}

    expect(@logic.horizontal_win(@board, 'x')).to eq(false)
  end 

  it 'will detect a vertical win' do 
   
    @board.populate_board
    4.times {@board.drop('a', 'x')}
    @board.render

    expect(@logic.vertical_win(@board, 'x')).to eq(true)

    
    @board.populate_board
    ['a', 'b', 'b', 'a'].each {|column| @board.drop(column, 'x')}
    @board.render

    expect(@logic.vertical_win(@board, 'x')).to eq(false)
  end

  it 'can detect if robot wins veritcally' do 
    
    @board.populate_board
    4.times {@board.drop('a', 'o')}
    @board.render

    expect(@logic.vertical_win(@board, 'o')).to eq(true)
  end

  it 'can detect if robot wins horizontally' do 
    
    @board.populate_board
    ['a', 'b', 'c', 'd'].each {|column| @board.drop(column, 'o')}
    @board.render

    expect(@logic.horizontal_win(@board, 'o')).to eq(true)
  end

  it 'can detect if player wins diagonally' do
    @board.populate_board
    @board.drop('a', 'x')
    @board.drop('b', 'o')
    @board.drop('b', 'x')
    2.times { @board.drop('c', 'o') }
    @board.drop('c', 'x')
    3.times { @board.drop('d', 'o') }
    @board.drop('d', 'x')
    @board.render

    expect(@logic.diagonal_win(@board, 'x')).to eq(true)

    mirrored_board = Board.new 
    mirrored_board.populate_board
    mirrored_board.contents = @board.mirrored_contents
    mirrored_board.render 

    expect(@logic.diagonal_win(mirrored_board, 'x')).to eq(true)
  end

  it 'can detect if a player loses diagonally' do 
    loser_board = Board.new
    loser_board.populate_board 
    loser_board.drop('b', 'o')
    loser_board.drop('b', 'x')
    2.times { loser_board.drop('c', 'o') }
    loser_board.drop('c', 'x')
    3.times { loser_board.drop('d', 'o') }
    loser_board.drop('d', 'x')
    loser_board.render

    expect(@logic.diagonal_win(loser_board, 'x')).to eq(false)

    loser_board.drop('a', 'x')
    loser_board.render 

    expect(@logic.diagonal_win(loser_board, 'x')).to eq(true)
  end
end