require_relative 'TimedPut'

# Project Euler problem 10:
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# Find the sum of all the primes below two million.

# Solution: done as Sieve of Sorenson
# utilizing memory optimization in the summation.
# More memory can be optimized here but kept some for
# debugging purposes. O(n^2) time with O(sqrt(n)) space complexity.

# Can be further optimized with bit operations based on keys instead
# of bigDecimal values.

def sum_n_primes(limit)
  # Sieve of Sorenson / Eratosthenes to maximize space
  # first block is sqrt of the top end of the range "Limit" or N
  # this is floored to be able to get the last few numbers in the limit
  valid_prime_list = sorenson_base_prime_list(limit)

  sum_of_deltas = []
  delta_set_length = Math.sqrt(limit).floor

  (1..delta_set_length-1).each do |i|
    # doing summation here instead of storage
    # I would probably favor file storage if I needed access
    # to blocks of storage sqrt N big

    sum_of_current_delta = 0
    bottom_range = (delta_set_length*i)+1
    top_range = (delta_set_length*i)+delta_set_length
    #temp_array = []
    (bottom_range..top_range).step(2) do |j|
      sum_of_current_delta += j if is_prime?(valid_prime_list, j)
    end

    #puts "Top end of array #{top_range}:\n#{temp_array.to_s}"
    #push summation through
    sum_of_deltas.push(sum_of_current_delta)
  end

  tail_end_primes = []
  #catch last bit until the actual limit
  (((delta_set_length**2)+1)..limit).step(2) do |i|
    tail_end_primes.push(i) if is_prime?(valid_prime_list, i)
  end

  #puts "this is the array sum of deltas:\n#{sum_of_deltas.to_s}"
  #puts "this is the array tail end primes:\n#{tail_end_primes.to_s}"

  valid_prime_list.reduce(:+) + sum_of_deltas.reduce(:+) + tail_end_primes.reduce(:+)
end

# max possible prime factors for any number below limiting value
# in this case, 2 million
def sorenson_base_prime_list(limit)
  valid_prime_list = [2]
  (3..Math.sqrt(limit).floor).step(2) do |i|
    valid_prime_list.each_with_index do |j,k|
      if k != valid_prime_list.length-1
        if i % j == 0
          break
        end
      else
        if i % j != 0  && j != i
          valid_prime_list.push(i)
        end
      end
    end
  end
  valid_prime_list
end

def is_prime?(valid_prime_list, j)
  valid_prime_list.each do |i|
    return false if j % i == 0
  end
  true
end

tputs{sum_n_primes(2000000)}