a = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
b = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']
c = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
d = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
e = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
f = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']
g = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p']
h = ['x', 'x', 'x', 'x', 'x', 'x', 'x', 'x']

$columns = {
  a: '0',
  b: '1',
  c: '2',
  d: '3',
  e: '4',
  f: '5',
  g: '6',
  h: '7'
}

board = [a, b, c, d, e, f, g, h]

def move_white(board, from_square, to_square)
  def column_conversion(square)
    square[0] = $columns[square[0].to_sym]
  end

  column_conversion(from_square)
  column_conversion(to_square)

  if board[from_square[0].to_i][from_square[1].to_i] == 'p'
    board[from_square[0].to_i][from_square[1].to_i] = 'x'
    board[to_square[0].to_i][to_square[1].to_i] = 'p'
    board.each { |row| print "#{row}\n" }
  end
end

move_white(board, 'g0', 'f0')




