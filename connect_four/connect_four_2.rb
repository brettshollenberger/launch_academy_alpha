class Array
  def same_values?
    self.uniq.length == 1
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = [
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0, 0]
    ]
    @columns = {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6
    }
  end

class Game
  attr_accessor :p1, :p2, :board, :columns, :player_color

  def initialize(p1, p2)
    if p1 == p2
      puts "Player names must be unique. Please enter new names."
      puts "What is player one's name?"
      p1 = gets.chomp
      puts "And what is player two's name?"
      p2 = gets.chomp
      initialize(p1, p2)
    end
    @p1 = p1
    @p2 = p2
    @player_color = {
      p1: 'r',
      p2: 'w'
    }
  end

  def vertical_board
    col0 = []
    col1 = []
    col2 = []
    col3 = []
    col4 = []
    col5 = []
    col6 = []
    (0..6).each do |num|
      board.each do |row|
        if num == 0
          col0.push(row[num])
        elsif num == 1
          col1.push(row[num])
        elsif num == 2
          col2.push(row[num])
        elsif num == 3
          col3.push(row[num])
        elsif num == 4
          col4.push(row[num])
        elsif num == 5
          col5.push(row[num])
        else
          col6.push(row[num])
        end
      end
    end
    @vertical_board_a = [col0, col1, col2, col3, col4, col5, col6]
  end

  def check_win_horiz
    board.each do |a|
      y = a.each_slice(4)
      y.each do |sub_a|
        if sub_a.same_values? && sub_a[0] == 'r'
          print 'Player 1 wins'
          break
        elsif sub_a.same_values? && sub_a[0] == 'w'
          print 'Player 2 wins'
        else
          next
        end
      end
    end
  end

  def check_win_vert
    @vertical_board_a.each do |column|
      x = column.each_slice(4)
      x.each do |sub_a|
        if sub_a.same_values? && sub_a[0] == 'r'
          print 'Player 1 wins'
          break
        elsif sub_a.same_values? && sub_a[0] == 'w'
          print 'Player 2 wins'
          break
        else
          next
        end
      end
    end
  end

  def drop_token(column, player)
    if column =~ /[a-gA-G]/
      (0..5).to_a.reverse.each do |row|
        if board[row][columns[column.to_sym]] == 'x'
          board[row][columns[column.to_sym]] = player_color[player]
          break
        end
        if num == 0
          puts 'Column is full'
        end
      end
    end
  end

end

  def check_win(r, c, player)
    score = 1
    check_NW(r, c, player)
  end
###############################################
  def check_NW(r, c, player)
    # Check the position northwest of the slot that was just entered.
    if board[r-1][c-1] == player && r-1 >= 0 && c-1 >= 0
      score += 1
      # Check recursively
      check_NW(r-1, c-1, player))
    else
      check_SE(r, c, player)
    end
  end

  def check_SE(r, c, player)
    if board[r+1][c+1] == player && r+1 <= 5 && c+1 <= 6
      score += 1
      check_SW(r+1, c+1, player)
    else
      next
    end
    if score >= 4
      puts "Player #{ player } wins NW/SE!"
      break
    else
      score = 1
      check_SW(r, c, player)
    end
  end
###############################################
  def check_SW(r, c, player)
    if board[r+1][c-1] == player && r+1 <= 5 && c-1 >= 0
      score += 1
      check_SW(r+1, c-1, player)
    else
      check_NE(r, c, player)
    end
  end

  def check_NE(r, c, player)
    if board[r-1][c+1] == player && r-1 >= 0 && c+1 <= 6
      score += 1
      check_SW(r-1, c+1, player)
    else
      next
    end
    if score >= 4
      puts "Player #{ player } wins SW/NE!"
      break
    else
      score = 1
      check_W(r, c, player)
    end
  end
###############################################
  def check_W(r, c, player)
    if board[r][c-1] == player && c-1 >= 0
      score += 1
      check_W(r, c-1, player)
    else
      check_E(r, c, player)
    end
  end

  def check_E(r, c, player)
    if board[r][c+1] == player && c+1 <= 6
      score += 1
      check_SW(r, c+1, player)
    else
      next
    end
    if score >= 4
      puts "Player #{ player } wins W/E!"
      break
    else
      score = 1
      check_N(r, c, player)
    end
  end
###############################################
  def check_N(r, c, player)
    if board[r-1][c] == player && r-1 >= 0
      score += 1
      check_N(r-1, c, player)
    else
      check_S(r, c, player)
    end
  end

  def check_S(r, c, player)
    if board[r+1][c] == player && r+1 <= 6
      score += 1
      check_SW(r+1, c, player)
    else
      next
    end
    if score >= 4
      puts "Player #{ player } wins N/S!"
      break
    else
      puts "Player #{ player } has not made a winning move."
    end
  end



