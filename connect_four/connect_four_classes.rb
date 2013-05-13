class Slot
  attr_accessor :filled, :row, :col

  def initialize(row, col)
    @filled = 0
    @row = row
    @col = col
  end

end

class Game
  attr_accessor :game_board, :rows, :counter, :player_turn

  def initialize
    @game_board = Array.new
    @rows = [5, 4, 3, 2, 1, 0]
    @counter = 0
    @player_turn = 1
    slot_it_up
    show_board
    turn(player_turn)
  end

  def slot_it_up
    6.times do |row_i|
      row = Array.new
      7.times do |col_i|
        row.push(Slot.new(row_i + 1, col_i + 1))
      end
      game_board.push(row)
    end
  end

  def clear_screen
    puts "\e[H\e[2J"
  end

  def inside_board?(row, col)
    (row >= 0) && (col >= 0) && (row <= @row_limit) && (col <= @column_limit)
  end

  def turn(player_turn)
    clear_screen
    puts "Player #{ player_turn }, select a column."
    puts
    show_board
    col = gets.chomp.to_i
    rows.each do |row|
      if game_board[row][col-1].filled == 0
        game_board[row][col-1].filled = 1
        break
      end
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

  def show_board
    game_board.each do |row|
      row.each do |slot|
        print " #{slot.filled} "
      end
      puts
    end
    puts " 1  2  3  4  5  6  7"
  end
end

g = Game.new


