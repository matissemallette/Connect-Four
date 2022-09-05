class Logic 

  def initialize
  end 

  def horizontal_win(board, character)
    cell = Cell.new(character)
    board.contents.each do |row|
      row.each_cons(4) do |row_subset|
        row_subset_chars = cells_to_chars(row_subset)
        if row_subset_chars.include?('x') || row_subset_chars.include?('o')
          if row_subset_chars.uniq.size <= 1 
            return true 
          end 
        end 
      end
    end
    false 
  end

  def cells_to_chars(cells)
    chars = []
    cells.each { |cell| chars << cell.content}
    return chars
  end
end