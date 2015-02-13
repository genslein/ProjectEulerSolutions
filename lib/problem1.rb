#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.
require_relative 'TimedPut'

  def find_three_or_five_multiples(number)
    (1...number).reduce(0) { |sum, current| (current % 3 == 0 || current % 5 == 0) ? (sum + current) : sum }
  end

tputs { find_three_or_five_multiples(1000)}
