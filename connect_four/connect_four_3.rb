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

    @row_limit = @board.length - 1
    @column_limit = @board[0].length - 1
  end

  def test_board(board)
    @board = board
  end

  def drop_piece?(col, player)
    (0..5).to_a.reverse.each do |num|
      if @board[num][col] == 0
        @board[num][col] = player
        return true
      end
    end
    return false
  end

  def view
    @board.each do |row|
      print row
      puts
    end
  end

  def inside_board?(r, c)
    (r >= 0) && (c >= 0) && (r <= @row_limit) && (c <= @column_limit)
  end

  # Row array
  def row(r, c)
    @board[r]
  end

  # # Column array
  def column(r, c)
    col = []
    (0..5).each do |num|
      col.push( @board[num][c] )
    end
    col
  end

  def upper_left_diag(r, c)
    u_l_diag = []
    (0..5).each do |i|
      u_l_diag.push( @board[r-i][c-i] ) if inside_board?(r-i, c-i)
    end
    u_l_diag.reverse!
  end

  def upper_right_diag(r, c)
    u_r_diag = []
    (0..5).each do |i|
      u_r_diag.push( @board[r-i][c+i] ) if inside_board?(r-i, c+i)
    end
    u_r_diag.reverse!
  end

  def lower_right_diag(r, c)
    l_r_diag = []
    (1..5).each do |i|
      l_r_diag.push( @board[r+i][c+i] ) if inside_board?(r+i, c+i)
    end
    l_r_diag
  end

  def lower_left_diag(r, c)
    l_l_diag = []
    (1..5).each do |i|
      l_l_diag.push( @board[r+i][c-i] ) if inside_board?(r+i, c-i)
    end
    l_l_diag
  end

  def upper_left_to_lower_right(r, c)
    x = upper_left_diag(r, c)
    x.concat(lower_right_diag(r, c))
    x
  end

  def upper_right_to_lower_left(r, c)
    x = upper_right_diag(r, c)
    x.concat(lower_left_diag(r, c))
    x
  end

  def super_array(row, col)
    super_array = [
      row(row, col),
      column(row, col),
      upper_left_to_lower_right(row, col),
      upper_right_to_lower_left(row, col)
    ]
  end

  def wins?(row, col, color)
    print super_array(row, col)
    (super_array(row, col)).each do |array|
      i = 0
      array.each do |element|
        if element == color
          i += 1
          if (i == 4) then return true end
        else
          i = 0
        end
      end
    end
    return false
  end
end

class Game
  attr_accessor :p1, :p2

  def initialize
    @b = Board.new
  end

  def get_input
    input = gets.chomp.to_i
    @b.drop_piece?(input, 1)
    @b.view
  end
end

test_board = [
  [1,  2,  3,  4,  5,  6,  7],
  [8, 9,  10,  11,  12,  13, 14],
  [15, 16, 17, 18, 19, 20, 21],
  [22,  23,  24,  25, 26, 27, 28],
  [29,  30,  31,  32,  33,  34,  35],
  [36,  37,  38,  39,  40,  41,  42]
]

g = Game.new

while true
  g.get_input
end

# row=2
# col=4
# b.drop_piece?(1, 1)
# b.view
