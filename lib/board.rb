require 'pry'
require './lib/cell'

class Board
	attr_reader :contents

	def initialize
		@contents = Array.new(6) { Array.new(7) }
	end

	def populate_board
		for row in 1..6 do
			for column in 1..7 do
				@contents[row - 1][column - 1] = Cell.new(row, column, 'x')
			end
		end
	end

	def render
		puts "\n"
		for row in 1..6 do
			print "row #{row} >> "
			for column in 1..7 do
				print "#{@contents[row - 1][column - 1].content}"
			end
			puts "\n"
		end
	end
end