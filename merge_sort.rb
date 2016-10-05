require 'minitest/autorun'

def merge_sort(arr)
  return arr if arr.length == 1

  a = arr[0..(arr.length / 2 - 1).ceil]
  b = arr[(arr.length / 2).ceil..-1]

  left, right = merge_sort(a), merge_sort(b)

  i, j = 0, 0
  output = []

  0.upto(arr.length - 1) do |_|
    if i >= left.length
      output.push(*right[j..-1])
      break
    end

    if j >= right.length
      output.push(*left[i..-1])
      break
    end

    if left[i] < right[j]
      output.push(left[i])
      i += 1
    else
      output.push(right[j])
      j += 1
    end
  end

  output
end

describe '#merge_sort' do
  it 'works' do
    merge_sort((0..1000).to_a.reverse).must_equal((0..1000).to_a)
    merge_sort([8, 7, 9, 5, 6, 1, 4, 2, 3]).must_equal([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
