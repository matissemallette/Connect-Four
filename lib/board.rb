require 'pry'

class Board
	attr_reader :contents, 
							:can_render
	attr_writer :contents

	def initialize
		@contents = Array.new(6) { Array.new(7) }
		@can_render = false
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
		@can_render = true
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
		column_number = letter_to_column(column_letter)
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

	def letter_to_column(column_letter)
		letter_to_num_map = {
			'a'=>0,
			'b'=>1,
			'c'=>2,
			'd'=>3,
			'e'=>4,
      'f'=>5,
      'g'=>6,
		} 
		column_number = letter_to_num_map[column_letter]
		if ['a', 'b','c','d','e','f','g'].include?(column_letter) == false 
			column_number = 0
		end
		return column_number
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