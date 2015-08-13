require_relative 'TimedPut'
require 'Prime'

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor_cheat(number)
    Prime.instance
    number.prime_division.last[0]
end

def largest_prime_factor_real(number)
  Math.sqrt(number-1).ceil.downto(1) do |i|
    if number % i == 0 && is_prime?(i)
      return i
    end
  end
end

def is_prime?(number)
  if number % 2 == 0
    false
  else
    start_val = Math.sqrt(number-1).ceil
    start_val += 1 if start_val.even?
    start_val.ceil.step(3, -2) do |x|
      return false if number % x == 0
    end
    true
  end
end

tputs{largest_prime_factor_cheat 13195}
tputs{largest_prime_factor_cheat 600851475143}

tputs{largest_prime_factor_real 13195}
tputs{largest_prime_factor_real 600851475143}