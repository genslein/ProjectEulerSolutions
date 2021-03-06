require 'rspec'
require_relative '../lib/MultiplePrimes'

describe 'MultiplePrimes' do
  attr_accessor :multiple_table

  before(:each) do
    @multiple_table = MultiplePrimes.new
  end

  it 'can tell if a number is prime' do
    expect(multiple_table.is_prime?(7)).to eq(true)
  end

  it 'can generate a list of n primes' do
    multiple_table.generate_n_primes(10)
    expect(multiple_table.prime_list.length).to eq(10)
  end

  it 'creates a table of primes that have been multiplied together' do
    multiple_table.generate_n_primes(10)
    multiple_table.calculate_multiple_table
    multiple_table.prime_list.values.each do |row|
      expect(row.length).to eq(10)
    end
  end

  it 'can run and print the whole prime multiplication table' do
    expect { multiple_table.run_full_prime_table_of_multiplications(10) }.to output.to_stdout
  end
end
