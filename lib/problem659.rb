require_relative 'TimedPut'

# Consider the sequence n^2+3 with n≥1.
# If we write down the first terms of this sequence we get:
# 4,7,12,19,28,39,52,67,84,103,124,147,172,199,228,259,292,327,364,... .
# We see that the terms for n=6 and n=7 (39 and 52) are both divisible by 13.
# In fact 13 is the largest prime dividing any two successive terms of this sequence.
#
# Let P(k) be the largest prime that divides any two successive terms of the sequence n^2+k^2.
# Find the last 18 digits of Summation: E k=1->1000000 P(k)
#

# max possible prime factors for any number below limiting value
# in this case, 2 million
def sorenson_base_prime_list(limit)
  (3..Math.sqrt(limit).floor).inject([2]).step(2) do |list, i|
    list.each_with_index do |j, k|
      if k != list.length-1
        if i % j == 0
          break
        end
      else
        if i % j != 0  && j != i
          list.push(i)
        end
      end
    end
    list
  end
end


def caluclate_largest_common_factor
  # starting summation generation
  iter = ->(n) { n**2 + 3 }

  # secondary position generator
  major = ->(n, k) { iter.call(n) + k**2 }

  # need to find solution to how to factor N
end


tputs{sum_n_primes(2000000)}