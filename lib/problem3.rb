require_relative 'TimedPut'
require 'Prime'
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor_cheat(number)
    number.prime_division.last[0]
end

def largest_prime_factor_real(number)
    a = []
    product_sum = 1

# the digit 2 is the first prime number,
# so we define it in x
    x = 2

    while product_sum < number
      if number % x == 0 && is_prime?(x)
        a << x
        product_sum *= x
      end
      x += 1
    end
    puts a
end

def is_prime? number
  (2..(number-1)).each { |x| return false if number % x == 0 }
  true
end

tputs{largest_prime_factor_cheat 13195}
tputs{largest_prime_factor_cheat 600851475143}

tputs{largest_prime_factor_real 13195}
tputs{largest_prime_factor_real 600851475143}