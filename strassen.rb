require 'minitest/autorun'

def multiply(matrix_a, matrix_b)
  if matrix_a.length == 1
    return [[matrix_a[0][0] * matrix_b[0][0]]]
  end

  a = matrix_a[0..(matrix_a.length / 2 - 1)].map{ |elem| elem[0..(matrix_a.length / 2 - 1)] }
  b = matrix_a[0..(matrix_a.length / 2 - 1)].map{ |elem| elem[(matrix_a.length / 2)..(-1)] }
  c = matrix_a[(matrix_a.length / 2)..(-1)].map{ |elem| elem[0..(matrix_a.length / 2 - 1)] }
  d = matrix_a[(matrix_a.length / 2)..(-1)].map{ |elem| elem[(matrix_a.length / 2)..(-1)] }
  e = matrix_b[0..(matrix_a.length / 2 - 1)].map{ |elem| elem[0..(matrix_a.length / 2 - 1)] }
  f = matrix_b[0..(matrix_a.length / 2 - 1)].map{ |elem| elem[(matrix_a.length / 2)..(-1)] }
  g = matrix_b[(matrix_a.length / 2)..(-1)].map{ |elem| elem[0..(matrix_a.length / 2 - 1)] }
  h = matrix_b[(matrix_a.length / 2)..(-1)].map{ |elem| elem[(matrix_a.length / 2)..(-1)] }

  p1 = multiply(a, matrices_op(f, h, '-'))
  p2 = multiply(matrices_op(a, b, '+'), h)
  p3 = multiply(matrices_op(c, d, '+'), e)
  p4 = multiply(d, matrices_op(g, e, '-'))
  p5 = multiply(matrices_op(a, d, '+'), matrices_op(e, h, '+'))
  p6 = multiply(matrices_op(b, d, '-'), matrices_op(g, h, '+'))
  p7 = multiply(matrices_op(a, c, '-'), matrices_op(e, f, '+'))

  new_a = matrices_op(matrices_op(matrices_op(p5, p4, '+'), p2, '-'), p6, '+')
  new_b = matrices_op(p1, p2, '+')
  new_c = matrices_op(p3, p4, '+')
  new_d = matrices_op(matrices_op(matrices_op(p1, p5, '+'), p3, '-'), p7, '-')
  join(new_a, new_b) + join(new_c, new_d)
end

def matrices_op(a, b, op)
  n = a.length

  if n == 1
    return [[a[0][0].send(op, b[0][0])]]
  end

  output = []

  0.upto(n - 1) do |i|
    row = []
    0.upto(n - 1) do |j|
      row << a[i][j].send(op, b[i][j])
    end
    output << row
  end

  output
end

def inspect(matrix)
  n = matrix.length

  0.upto(n - 1) do |i|
    puts matrix[i].inspect
  end
end

def join(a, b)
  output = []
  0.upto(a.length - 1) do |i|
    output[i] = a[i] + b[i]
  end

  output
end

describe '#join' do
  it 'joins' do
    x = [
      [1, 2],
      [3, 4]
    ]
    y = [
      [5, 6],
      [7, 8]
    ]
    z = [
      [1, 2, 5, 6],
      [3, 4, 7, 8]
    ]
    join(x, y).must_equal(z)
  end
end

describe '#multiply' do
  it 'multiplies two matrices' do
    x = [
      [1, 2],
      [3, 4]
    ]
    y = [
      [5, 6],
      [7, 8]
    ]
    z = [
      [19, 22],
      [43, 50]
    ]
    multiply(x, y).must_equal(z)

    x = [
      [1, 2, 3, 4],
      [5, 6, 7, 8],
      [9, 10, 11, 12],
      [13, 14, 15, 16]
    ]
    y = [
      [17, 18, 19, 20],
      [21, 22, 23, 24],
      [25, 26, 27, 28],
      [29, 30, 31, 32]
    ]
    z = [
      [250, 260, 270, 280],
      [618, 644, 670, 696],
      [986, 1028, 1070, 1112],
      [1354, 1412, 1470, 1528]
    ]
    multiply(x, y).must_equal(z)
  end
end
describe '#matrices_op' do it 'adds two matrices' do
    matrices_op([[1, 2], [3, 4]], [[5, 6], [7, 8]], '+').must_equal([[6, 8], [10, 12]])
  end

  it 'substracts two matrices' do
    matrices_op([[1, 2], [3, 4]], [[5, 6], [7, 8]], '-').must_equal([[-4, -4], [-4, -4]])
  end
end
