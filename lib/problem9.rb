require_relative 'TimedPut'
# algorithm understood from stack overflow post seen here:
# http://stackoverflow.com/questions/575117/generating-unique-ordered-pythagorean-triplets

def generate_pythagorean_triple(sum_to_hit)
  (1).upto(sum_to_hit) do |a|
    b = a+1
    c = b+1

    # bound c to the total sum, shouldn't be actually equal before the value is found
    while c <= sum_to_hit
      # making sure not to do more than a < b < c
      while  a**2 + b**2 > c**2
        c += 1
      end

      # checking to bound c to less than the sum though its somewhat arbitrary
      if a**2 + b**2 == c**2 && a + b + c == sum_to_hit
        return [a,b,c]
      end
      b += 1
    end
  end
end


tputs{generate_pythagorean_triple(1000).reduce(:*)}