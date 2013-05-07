a = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
b = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']
c = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
d = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
e = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
f = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
g = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']
h = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']

board = [a, b, c, d, e, f, g, h]

def move_white(board, from_square, to_square)
  def column_conversion(square)
    if square[0] == 'a'
      square[0] = "0"
    elsif square[0] == 'b'
      square[0] = "1"
    elsif square[0] == 'c'
      square[0] = "2"
    elsif square[0] == 'd'
      square[0] = "3"
    elsif square[0] == 'e'
      square[0] = "4"
    elsif square[0] == 'f'
      square[0] = "5"
    elsif square[0] == 'g'
      square[0] = "6"
    elsif square[0] == 'h'
      square[0] = "7"
    else
      puts 'Entry not valid'
    end
  end
  column_conversion(from_square)
  column_conversion(to_square)

  if board[from_square[0].to_i][from_square[1].to_i] != 'x'
    board[from_square[0].to_i][from_square[1].to_i] = 'x'
    board[to_square[0].to_i][to_square[1].to_i] = 'p'
    board.each { |row| print "#{row}\n" }
  end
end

move_white(board, 'g0', 'f0')




