require_relative 'TimedPut'

def diff_sum_squared_with_sum_of_squares(number)
  (number*(number/2) + (number/2))**2 - (number*(number+1)*((2*number)+1)) / 6
  #((1..100).reduce(:+))**2 - (1..100).reduce(0){|sum, i| sum += i**2}
end

tputs{diff_sum_squared_with_sum_of_squares(100)}