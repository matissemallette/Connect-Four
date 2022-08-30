require './lib/board'
require './lib/cell'


class Game
  attr_reader :running, 
              :has_printed_welcome, 
              :board

  def initialize 
    @running = false 
    @has_printed_welcome = false
    @board = Board.new 
    @board.populate_board
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
end