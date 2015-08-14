require_relative 'TimedPut'

def find_xth_placed_prime(position)
  prime_lookup_hash(position)
  #Hash.new{|h,k| k > 1 ? h[k-1] + h[k-2] : k}
end

def prime_lookup_hash(position)
  prime_factor = 3
  counter = 2

  while counter < position
    prime_factor += 2
    if is_prime? prime_factor
      counter += 1
    end
  end
  prime_factor
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

tputs{find_xth_placed_prime(10001)}