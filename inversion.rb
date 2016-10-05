require 'minitest/autorun'

def inversion(arr)
end

describe '#inversion' do
  it 'works' do
    inversion([1, 3, 5, 2, 4, 6]).must_equal(15)
    inversion([6, 5, 4, 3, 2, 1]).must_equal(15)
  end
end
