class WinConditionArrays
  def same_values?
    self.uniq?.length == 0
  end
end

class Board

  def initialize
    @board = []
    42.times do |i|
      @board.push(i)
    end
  end

  def test_board(board)
    @board = board
  end

  def print_board
    i = 0
    @board.each do |e|
      print " #{e}"
      i += 1
      puts() if (i % 7) == 0
    end
  end



  def drop_piece
  end

  def inside_board?(r, c)
    (r >= 0) && (c >= 0) && (r <= @row_limit) && (c <= @column_limit)
  end

  # def win_diags(r, c)


  # Row array
  # win_row = @board[r]

  # # Column array
  # win_column = []
  # (0..5).each do |num|
  #   win_column.push(board[num][c])
  # end

  # L-ot-R diagonal
  # def win_diags(r, c)
  #   left_to_right_diag_win = []
  #   right_to_left_diag_win = []
  #   (0..5).each do |i|
  #     left_to_right_diag_win.unshift( @board[r-i][c-i] ) if inside_board?(r-i, c-i)
  #     left_to_right_diag_win.push( @board[r+i][c+i] ) if inside_board?(r+i, c-i) unless i == 0
  #     print left_to_right_diag_win
  #     puts
  #   end
  #   # start_array_rtl = []
  #   # end_array_rtl = []
  #   # (0..5).each do |i|
  #   #   if inside_board?(r+i, c+i)
  #   #     start_array_rtl.push( @board[r+i][c-i] )
  #   #     end_array_rtl.push( @board[r-i][c+i] )
  #   #     right_to_left_diag_win << start_array_rtl.reverse
  #   #     right_to_left_diag_win << end_array_rtl
  #   #     print right_to_left_diag_win
  #   #     puts
  #   #    else
  #   #     puts "breaked!"
  #   #     break
  #   #   end
  #   # end
  #   return left_to_right_diag_win, right_to_left_diag_win
  # end

  # diags1, diags2 = win_diags( )
  # the_array_of_arrays = [
  #   row_holder,
  #   column_holder,
  #   diags1,
  #   diags2
  # ]

  # the_array_of_arrays.each do |array|
  #   i = 0
  #   array.each do |element|
  #     if element == color
  #       i += 1
  #       if (i == 4) then return true
  #     else
  #       i = 0
  #     end
  #   end
  #   false
  # end

end

test_board = [
  [1,  2,  3,  4,  5,  6,  7],
  [8, 9,  10,  11,  12,  13, 14],
  [15, 16, 17, 18, 19, 20, 21],
  [22,  23,  24,  25, 26, 27, 28],
  [29,  30,  31,  32,  33,  34,  35],
  [36,  37,  38,  39,  40,  41,  42]
]

b = Board.new
b.print_board
# b.test_board(test_board)


