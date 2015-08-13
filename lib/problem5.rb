require_relative 'TimedPut'

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def static_def
  [16, 9, 5, 7, 11, 13, 17, 19]
end

def redo_stats
  static_def.reduce(:*)
end

#correct answer below
def result_generate_static()
  result_hash = {}

  (2..20).map{|i| prime_factors_to_value(i) }.each do |hash|
    hash.each_pair do |k,v|
      if result_hash[k].nil?
        result_hash[k] = v
      elsif result_hash[k] < v
        result_hash[k] = v
      end
    end
  end
  puts result_hash.to_s
  result_hash.map{|k,v| k**v}.inject(:*)
end

def prime_factors_to_value(number)
  result = {}
  temp = number
  [2,3,5,7,11,13,17,19].each do |i|
    while temp % i == 0 && temp != 1
      if result[i].nil?
        result[i] = 1
      else
        result[i] += 1
      end
      temp /= i
    end
  end
  result
end

tputs{result_generate_static}
tputs{redo_stats}