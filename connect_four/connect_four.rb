class Array
  def same_values?
    self.uniq.length == 1
  end
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
    @l1 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @l2 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @l3 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @l4 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @l5 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @l6 = ['x', 'x', 'x', 'x', 'x', 'x', 'x']
    @board = [@l1, @l2, @l3, @l4, @l5, @l6]
    @columns = {
      a: 0,
      b: 1,
      c: 2,
      d: 3,
      e: 4,
      f: 5,
      g: 6
    }
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
      (0..5).to_a.reverse.each do |num|
        if board[num][columns[column.to_sym]] == 'x'
          board[num][columns[column.to_sym]] = player_color[player]
          break
        end
        if num == 0
          puts 'Column is full'
        end
      end
    end
  end

end
