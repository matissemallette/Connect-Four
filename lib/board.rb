require 'pry'

class Board
	attr_reader :contents
	attr_writer :contents

	def initialize
		@contents = Array.new(6) { Array.new(7) }
	end

	def populate_board
		for row in 1..6 do
			for column in 1..7 do
				@contents[row - 1][column - 1] = "."
			end
		end
	end

	def render
		num_of_rows = contents.size
		num_of_columns = contents[0].size
			print "\ncolumns: A, B, C, D, E, F, G\n"
		for row in 1..num_of_rows do
			print "row #{row} >> "
			for column in 1..num_of_columns do
				print "#{@contents[row - 1][column - 1]}  "
			end
			puts "\n"
		end
		puts "\n"
	end

	def is_occupied?(row, column) 
		if @contents[row][column] != '.'
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
		@contents[bottom_of_column][column_number] = value
	end

	def is_full?
		is_full = true
		@contents.each do |row|
			row.each do |content| 
				if content == "."
					is_full = false
				end
			end
		end
		return is_full 
	end

	def rotated_contents 
		@contents.transpose.map(&:reverse)
	end

	def mirrored_contents 
		mirrored_contents = []
		@contents.each do |row| 
			mirrored_contents << row.reverse
		end
		return mirrored_contents
	end
end