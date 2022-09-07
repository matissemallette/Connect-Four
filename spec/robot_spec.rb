require 'rspec'
require './lib/robot.rb'
require './lib/board.rb'

RSpec.describe Robot do
  before(:each) do
    @robot = Robot.new
  end

  it 'exists' do
    expect(@robot).to be_an_instance_of(Robot)
  end

  it 'will not place chip in full column' do
    board = Board.new
    board.populate_board
    6.times do
      board.drop('a', 'O')
      board.drop('b', 'O')
      board.drop('c', 'O')
      board.drop('d', 'O')
      board.drop('e', 'O')
      board.drop('f', 'O')
    end
    5.times do 
      board.drop('g', 'O')
    end

    puts "\n" 

    puts "before robot makes his move:"
    board.render
    
    @robot.make_decision(board)
    robot_choice = @robot.current_decision
    board.drop(robot_choice, 'X')

    puts "after robot makes his move:"
    board.render
    
    expect(robot_choice).to eq('g')
  end
end