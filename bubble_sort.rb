require 'minitest/autorun'

def bubble_sort(arr)
  not_sorted = true

  while(not_sorted)
    not_sorted = false

    0.upto(arr.length - 2) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        not_sorted = true
      end
    end
  end

  arr
end

describe '#bubble_sort' do
  it 'works' do
    bubble_sort((0..100_000).to_a.reverse).must_equal((0..100_000).to_a)
    bubble_sort([8, 7, 9, 5, 6, 1, 4, 2, 3]).must_equal([1, 2, 3, 4, 5, 6, 7, 8, 9])
  end
end
