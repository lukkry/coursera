require 'minitest/autorun'

def insertion_sort(arr)
  output = [arr.pop]

  arr.each do |elem|
    idx = nil

    0.upto(output.length - 1) do |i|
      if elem <= output[i]
        idx = i
        break
      end
    end

    idx ||= output.length
    output.insert(idx, elem)
  end

  output
end

describe '#insertion_sort' do
  it 'works' do
    insertion_sort([3, 2, 1]).must_equal([1, 2, 3])
    insertion_sort([8, 7, 9, 5, 6, 1, 4, 2, 3]).must_equal([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
