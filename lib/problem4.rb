#Problem 4 Palindromic number
# A palindromic number reads the same both ways. The largest palindromic number from 2 two-digit
# numbers is 91 x 99 = 9009. Find the largest palindrome product from 2 three-digit numbers.

require_relative 'TimedPut'

def palindromic_number
  value = 0
  999.downto(900) do |x|
    x.downto(900) do |y|
      if (x*y).to_s == (x*y).to_s.reverse
        #puts (x*y).to_s + " and the values are " + x.to_s + " " + y.to_s
       return x*y
      end
    end
  end
end


tputs{palindromic_number}