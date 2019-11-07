import math

def sorenson_base_primes(num):
    """
    Performs the base Sieve Of Sorenson/Eratosthenes with minimal optimizations. 
    Additional optimizations have been made in the ruby version
    """
    valid_prime_list = [2]
    for i in range(3, num, 2):
        for k, j in enumerate(valid_prime_list):
            if k != len(valid_prime_list)-1:
                if i % j == 0:
                    break
            else:
                if i % j != 0 and j != i:
                    valid_prime_list.append(i)

    return len(valid_prime_list)
