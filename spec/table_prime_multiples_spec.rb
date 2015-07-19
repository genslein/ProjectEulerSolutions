require_relative './test_helper'

describe 'MultiplePrimes' do

  before(:each) do
    @multiple_table = MultiplePrimes.new
  end

  it 'can tell if a number is prime' do
    expect(@multiple_table.is_prime?(7)).to eq(True)
  end

  it 'can generate a list of n primes' do
    @multiple_table.generate_n_primes(10)
    expect(@multiple_table.prime_list.length).to eq(10)
  end

  it 'creates a table of primes that have been multiplied together' do
    @multiple_table.generate_n_primes(10)
    @multiple_table.calculate_multiple_table
    expect(@multiple_table.prime_list.values[0].length).to eq(10)
  end

  it 'can run and print the whole prime multiplication table' do
    expect(@multiple_table.run_full_prime_table_of_multiplications(10)).to output.to_stdout
  end
end
