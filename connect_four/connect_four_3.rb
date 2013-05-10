class WinConditionArrays
  def same_values?
    self.uniq?.length == 0
  end
end

class FullStackException < StandardError
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

  def piece_dropped?(col, player)
    (0..5).to_a.reverse.each do |num|
      if @board[num][col] == 0
        @board[num][col] = player
        return num, col
      end
    end
    raise FullStackException.new
  end

  def view
    @board.each do |row|
      print "|#{row}|"
      puts
    end
    puts "  1  2  3  4  5  6  7"
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
  attr_accessor :player_turn, :b, :end_game, :current_player

  def initialize(p1, p2)
    @b = Board.new
    @counter = 0
    @player_turn = 1
    @end_game = false
    @p1 = p1
    @p2 = p2
    @current_player = p1
  end

  def reset_game
    @b = Board.new
    @counter = 0
    @player_turn = 1
    @end_game = false
  end

  def turn(input)
    begin
      if @b.inside_board?(0, input.to_i-1)
        row, col = @b.piece_dropped?(input.to_i-1, @player_turn)
        @b.view
        if @counter >= 41
          puts "Stalemate!"
          prompt_end
        end
        if @b.wins?(row, col, @player_turn)
          puts "#{@current_player} wins!"
          prompt_end
        end
        change_turn
      else
        puts "Please enter a column between 1 and 7"
      end
    rescue FullStackException
      puts "That column is full! Try again"
    end
  end

  def change_turn
    @counter += 1
    if @counter.even?
      @player_turn = 1
      @current_player = @p1
    else
      @player_turn = 2
      @current_player = @p2
    end
  end

  def prompt_end
    puts "Thanks for playing. Would you like to play again? (y/n)"
    if gets.chomp =~ /^[yY]/
      reset_game
    else
      @end_game = true
    end
  end

end

puts "Welcome to Connect 4, please enter Player 1's name:"
p1 = gets.chomp.capitalize
puts "Awesome. Now enter Player 2's name:"
p2 = gets.chomp.capitalize

g = Game.new(p1, p2)

g.b.view
while !g.end_game
  puts "#{g.current_player}, make your move. Enter 'q' at any time to exit"
  input = gets.chomp
  if input == 'q'
    break
  else
    g.turn(input)
  end
end

# row=2
# col=4
# b.drop_piece?(1, 1)
# b.view
