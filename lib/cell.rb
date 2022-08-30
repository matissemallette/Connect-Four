class Cell
	attr_reader :row, :column, :content
	attr_writer :row, :column, :content

	def initialize(row, column, content)
		@row = row
		@column = column
		@content = content
	end

	def empty?
		if content == '.'
			return true
		else
			return false
		end
	end
end