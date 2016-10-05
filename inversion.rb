require 'minitest/autorun'

def inversion(arr)
  return [arr, 0] if arr.length == 1

  left = arr[0..(arr.length / 2 - 1)]
  right = arr[(arr.length / 2)..-1]

  sorted = []
  count = 0
  b, count_left = inversion(left)
  c, count_right = inversion(right)
  i, j = 0, 0

  0.upto(arr.length - 1) do |k|
    if i == b.length
      sorted += c[j..-1]
      break
    end

    if j == c.length
      sorted += b[i..-1]
      break
    end

    if b[i] <= c[j]
      sorted[k] = b[i]
      i += 1
    else
      sorted[k] = c[j]
      j += 1
      count += b[i..-1].length
    end
  end

  [sorted, count_left + count_right + count]
end

describe '#inversion' do
  it 'works' do
    inversion([1, 3, 5, 2, 4, 6])[1].must_equal(3)
    inversion([6, 5, 4, 3, 2, 1])[1].must_equal(15)
  end
end
