class Cell
	attr_reader :content
	attr_writer :content

	def initialize(content)
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