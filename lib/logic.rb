class Logic 

  def initialize
  end 

  def horizontal_win(board, character)
    board.contents.each do |row|
      row.each_cons(4) do |row_subset|      
        if row_subset.include?(character) 
          if row_subset.uniq.size <= 1 
            return true 
          end 
        end 
      end
    end
    false 
  end

  def vertical_win(board, character)
    flipped_board = Board.new
    flipped_board.contents = board.rotated_contents
    self.horizontal_win(flipped_board, character)
  end

  def diagonal_win(board, character)
    win = false 
    win = test_diagonal_win(board, character)
    if win == false 
      reversed_board = Board.new
      reversed_board.populate_board
      reversed_board.contents = board.mirrored_contents
      win = test_diagonal_win(reversed_board, character)
    end
    return win 
  end

  def test_diagonal_win(board, character)
    num_of_rows = board.contents.length 
    num_of_columns = board.contents[0].length

    horizontal_search_range = num_of_columns - 4
    vertical_search_range = num_of_rows - 4 

    for r in num_of_rows.downto(vertical_search_range)
      for c in 0..horizontal_search_range
        current_diagonal_selection = []
        for i in 0..3 do 
          current_diagonal_selection << board.contents[r - 1 - i][c + i]
        end
        if current_diagonal_selection.include?(character)
          if current_diagonal_selection.uniq.size <= 1 
            return true
          end
        end
      end
    end
    return false
  end
end