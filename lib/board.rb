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
				@contents[row - 1][column - 1] = Cell.new(row, column, '.')
			end
		end
	end

	def render

			print "\ncolumns: A, B, C, D, E, F, G\n"
		for row in 1..6 do
			print "row #{row} >> "
			for column in 1..7 do
				print "#{@contents[row - 1][column - 1].content}  "
			end
			puts "\n"
		end
		puts "\n"
	end

	def is_occupied?(row, column) 
		if @contents[row][column].content != '.'
			return true
		else
			return false
		end
	end

	def drop(column_letter, value)
		if column_letter.downcase == 'a'
			column_number = 0
		elsif column_letter.downcase == 'b'
			column_number = 1
		elsif column_letter.downcase == 'c'
			column_number = 2
		elsif column_letter.downcase == 'd'
			column_number = 3
		elsif column_letter.downcase == 'e'
			column_number = 4
		elsif column_letter.downcase == 'f'
			column_number = 5
		elsif column_letter.downcase == 'g'
			column_number = 6
		else
			# if input is invalid, defaults to A aka first aka 0th column
			column_number = 0
		end

		bottom_of_column = 0
		for i in 0..5 do
			if self.is_occupied?(i, column_number) == true 
				bottom_of_column = i - 1
				break
			end

			if i == 5 && self.is_occupied?(i, column_number) == false
				bottom_of_column = 5
			end
		end
		@contents[bottom_of_column][column_number].content = value
	end

	def is_full?
		is_full = true

		@contents.each do |cell|
			if cell.empty? == true
				is_full = false
			end
		end

		return is_full 
	end
end