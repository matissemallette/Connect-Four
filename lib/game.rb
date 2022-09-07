require './lib/board'
require './lib/cell'
require './lib/robot'
require './lib/logic'

class Game
  attr_reader :running, 
              :has_printed_welcome, 
              :board

  def initialize
    @running = false 
    @wants_to_play = true
    @has_printed_welcome = false
    @board = Board.new 
    @board.populate_board
    @robot = Robot.new
    @logic = Logic.new
  end

  def welcome_greeting
    while @wants_to_play == true do 
      puts "Welcome to CONNECT FOUR."
      puts "Enter p to play. Enter quit to quit."
      @has_printed_welcome = true 
      play_or_quit = $stdin.gets.chomp.downcase
      if play_or_quit == "p"
        self.start
      elsif play_or_quit == "quit"
        @running = false
        @wants_to_play = false
        puts "Bye sucka, don't let the door hit ya on the way out."
      else 
        puts 'Invalid Input, try again.'
      end 
    end
  end

  def start 
    @running = true 
    @board.populate_board
    while @running == true 
      self.turn
    end
  end

  def turn 
    @board.render

    if @board.is_full? == true 
      puts "The board is full, the game is a draw.\n\n"
      @board.populate_board
      @running = false
      return
    end

    puts "Please select a column (a-g) to drop your chip! Type quit to exit the game."
    input = $stdin.gets.chomp.to_s.downcase

    if valid_input?(input) == true 

      if @board.is_occupied?(0, self.letter_to_number_map(input)) == true
        puts "that column is full, choose another column"
      else
        @board.drop(input, 'x')

        if @logic.horizontal_win(@board, 'x') || @logic.vertical_win(@board, 'x') 
          self.player_wins
        end
        if @logic.diagonal_win(@board, 'x') == true 
          self.player_wins
        end

        @robot.make_decision(@board)
        @board.drop(@robot.current_decision, 'o')

        if @logic.horizontal_win(@board, 'o') || @logic.vertical_win(@board, 'o')
          self.robot_wins
        end

        if @logic.diagonal_win(@board, 'o') == true
          self.robot_wins
        end

        @board.render
      end

    elsif input == "quit"
      @running = false
    else 
      puts "Invalid input, please try again."
    end
  end

  def valid_input?(input)
    if ['a', 'b', 'c', 'd', 'e', 'f', 'g'].include?(input)
      return true 
    else 
      return false
    end
  end

  def letter_to_number_map(input)
		if self.valid_input?(input) == false 
      puts "invalid input"
      return nil
		end

		letter_to_num_map = {
			'a'=>0,
			'b'=>1,
			'c'=>2,
			'd'=>3,
			'e'=>4,
      'f'=>5,
      'g'=>6,
		} 

    return letter_to_num_map[input]
	end

  def player_wins
    puts "=======Player wins!======="
    @running = 0
  end

  def robot_wins 
    puts "=======Robot wins!======="
    @running = 0
  end
end