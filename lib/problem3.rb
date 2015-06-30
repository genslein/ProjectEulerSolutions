require_relative 'TimedPut'

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor(number)
  (number..1).select(0) { |curr, val| val.lcm(number) > curr ? curr = val.lcm(number) : curr}
end

tputs{largest_prime_factor 13195}
tputs{largest_prime_factor 600851475143}