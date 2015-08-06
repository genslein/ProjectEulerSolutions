#Problem 4 Palindromic number
# A palindromic number reads the same both ways. The largest palindromic number from 2 two-digit
# numbers is 91 x 99 = 9009. Find the largest palindrome product from 2 three-digit numbers.

require_relative 'TimedPut'

def palindromic_number
  999.downto(100) do |x|
    999.downto(100) do |y|
      if (x*y).to_s == (x*y).to_s.reverse
        return (x*y).to_s + " and the values are " + x.to_s + " " + y.to_s
      end
    end
  end
end


tputs{palindromic_number}