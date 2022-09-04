require './lib/board'
require './lib/cell'
require './lib/robot'

class Game
  attr_reader :running, 
              :has_printed_welcome, 
              :board

  def initialize 
    @running = false 
    @has_printed_welcome = false
    @board = Board.new 
    @board.populate_board
    @robot = Robot.new
  end

  def welcome_greeting
    puts "Welcome to CONNECT FOUR."
    puts "Enter p to play. Enter q to quit."
    @has_printed_welcome = true 
    play_or_quit = $stdin.gets.chomp.downcase
    if play_or_quit == "p"
      self.start
    elsif play_or_quit == "q"
      puts "Bye sucka, don't let the door hit ya on the way out."
    else 
      puts 'Invalid Input, try again.'
      self.welcome_greeting
    end 
  end

  def start 
    @running = true 
    @board.render
  end

  def turn 
    puts "Please select a column (a-g) to drop your chip! Type quit to exit the game."
    input = $stdin.gets.chomp.downcase
    if valid_input?(input) == true 
      #game shit will live here. 
      @board.drop(input, 'x')
      @robot.make_decision(@board)
      @board.drop(@robot.current_decision, 'o')
      @board.render
      self.turn
    elsif input == "quit"
      return
    else 
      puts "Invalid input, please try again."
      self.turn
    end
  end

  def valid_input?(input)
    if ['a', 'b', 'c', 'd', 'e', 'f', 'g'].include?(input)
      return true 
    else 
      return false
    end
  end
end