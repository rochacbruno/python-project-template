# Prime Factorization in Python

## Overview

This Python script contains a function named `get_prime_factors` that computes the prime factorization of a given integer. The function returns a list of tuples, where each tuple consists of a prime factor and its corresponding exponent.

Prime factorization is the process of breaking down a composite number into its prime factors, which are the prime numbers that multiply together to yield the original number.

## Function Definition

### `get_prime_factors(n)`

- **Input**: An integer `n` that you want to factorize.
- **Output**: A list of tuples, where each tuple contains a prime factor and its exponent.

### How It Works

1. The function initializes an empty list `prime_factors` to store the prime factors and their counts.
2. It checks for the smallest prime number, 2, and repeatedly divides `n` by 2 while counting the number of times it divides evenly.
3. It then checks for other odd prime factors starting from 3 and continues dividing `n` by these numbers while counting their occurrences.
4. Finally, if `n` is still greater than 2, it is considered a prime factor and added to the list.

## Usage

To use the `get_prime_factors` function, simply call it with an integer value. Here's an example of how to use the function:

```python
# Example usage
result = get_prime_factors(60)
print(result)  # Output: [(2, 2), (3, 1), (5, 1)]

