def factors(number)
  dividend = number
  divisors = []

  if number <= 0
    return "Positive numbers only."
  else
    loop do
      divisors << number / dividend if number % dividend == 0
      dividend -= 1
      break if dividend == 0
    end
  end
  divisors
end

# solution:

while dividend > 0 do
  divisors << number / dividend is number % dividend == 0
  dividend -= 1
end

# bonus 1: number % dividend == 0 checks if something is a divisor of the dividend.
#          if false, that is, if there is a remainder, number is not a divisor.

# divisors ensures that the array containing the gathered divisors will be returned

