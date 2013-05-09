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

  def drop_token(column, player)
    (0..5).to_a.reverse.each do |num|
      if board[num][columns[column.to_sym]] == 'x'
        board[num][columns[column.to_sym]] = 'r' if player=self.p1; 'w'
        break
      end
      if num == 0
        puts 'Column is full'
      end
    end
  end

end





