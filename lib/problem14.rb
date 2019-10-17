require_relative 'TimedPut'

# Project Euler Problem 14
# The following iterative sequence is defined for the set of positive integers:

# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
# Although it has not been proved yet (Collatz Problem),
# it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.

def generate_collatz_brute
  999_999.downto(1).map do |i|
    collatz_chain_collector(i)
  end.max
end

def collatz_iterator(integer)
  integer.even? ? integer / 2 : (3 * integer) + 1
end

def collatz_chain_collector(starting_int)
  arr = [starting_int]

  while arr.last != 1
    arr.push(collatz_iterator(arr.last))
  end
  arr.length
end

# reversing this would be caching the results ascending so we don't regenerate every chain every time
# http://code.jasonbhill.com/c/project-euler-problem-14/

tputs { generate_collatz_brute }
