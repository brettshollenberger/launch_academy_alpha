class WinConditionArrays
  def same_values?
    self.uniq?.length == 0
  end
end

class Board

  def initialize
    @board = [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ]

    @row_limit = @board[0].length - 1
    @column_limit = @board.length - 1
  end

  def test_board(board)
    @board = board
  end

  def drop_piece
  end

  def inside_board?(r, c)
    if (r >= 0)
      puts "#{r} >= 0"
      if (c >= 0)
        puts "#{c} >= 0"
        if (r <= @row_limit)
          puts "#{r} <= #{@row_limit} (row limit)"
          if c <= @column_limit
            puts "#{c} <= #{@column_limit}"
            return true
          end
        end
      end
    end
    return false
  end

  # Row array
  # win_row = @board[r]

  # # Column array
  # win_column = []
  # (0..5).each do |num|
  #   win_column.push(board[num][c])
  # end

  # L-ot-R diagonal
  def win_diags(r, c)
    start_array_ltr = []
    end_array_ltr = []
    left_to_right_diag_win = []
    right_to_left_diag_win = []
    (0..5).each do |i|
      if inside_board?(r+i, c+i)
        start_array_ltr.push( @board[r-i][c-i] )
        end_array_ltr.push( @board[r+i][c+i] )
        left_to_right_diag_win << start_array_ltr.reverse
        left_to_right_diag_win << end_array_ltr
        print left_to_right_diag_win
      else
        puts "breaked!"
        break
      end
    start_array_rtl = []
    end_array_rtl = []
    (0..5).each do |i|
      if inside_board?(r+i, c+i)
        start_array_rtl.push( @board[r+i][c-i] )
        end_array_rtl.push( @board[r-i][c+i] )
        right_to_left_diag_win << start_array_rtl.reverse
        right_to_left_diag_win << end_array_rtl
       else
        puts "breaked!"
        break
      end
    end
    return left_to_right_diag_win, right_to_left_diag_win
  end

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
b.test_board(test_board)
ltr, rtl = b.win_diags(2,2)
print ltr
puts
print rtl

