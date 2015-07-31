require 'matrix'
require 'pp'

class MultiplePrimes

  attr_accessor :prime_list
  attr_reader :max_int

  def initialize()
    @prime_list = Hash.new
    @max_int = 4611686018427387903
  end

  def is_prime? number
    if number % 2 == 0
      false
    else
      (3..(number-1)).step(2) { |x| return false if number % x == 0 }
      true
    end
  end

  def generate_n_primes(number)
    if number < 1
      return
    end

    prime_list[2] = [4]
    if number == 1
      return
    end

    (3..max_int).step(2) do |i|
      if is_prime?(i)
        prime_list[i] = Array.new
      end
      if prime_list.count == number
        break;
      end
    end
  end

  def calculate_multiple_table
    v1 = Matrix.column_vector(prime_list.keys)
    prime_list.keys.each do |i|
      prime_list[i] = (v1 * Matrix.row_vector([i])).column(0).to_a
    end
  end

  def print_multiplication_table
    pp prime_list
  end

  def run_full_prime_table_of_multiplications(number)
    generate_n_primes(number)
    calculate_multiple_table
    print_multiplication_table
  end
end

p = MultiplePrimes.new
p.run_full_prime_table_of_multiplications(10)

