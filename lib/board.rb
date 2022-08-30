require 'pry'

class Board
	def initialize
  	@contents = Array.new(7) { Array.new(6) { |i| i = '.' } }
  end

  def render
    p @contents + "\n"
  end
end