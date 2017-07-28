1. a method that returns the sum of two integers

Ask the user for two integers
  - save each value

Add the two values together

Output the sum

---

START

GET integer
SET integer1 = integer given
GET integer
SET integer2 = integer given

PRINT integer1 + integer2

END


------

2. a method that takes an array of strings,
   and returns a string that is all those strings concatenated together

Iterate through the array one by one
  - add each string to a single concatenated string

Print new string

---

START

SET new_string = ''

FOR EACH value in given array
  - SET new_string = new_string + value

PRINT new_string


------

3. a method that takes an array of integers, 
   and returns a new array with every other element

Iterate through the array one by one
  - save the first value to a new array
  - move 2 indexes
  - save this value to a new array

After iterating through the array, return the new array

---

Given an array "array"

START

SET iterator = 0
SET new_array = []

WHILE iterator < length of array
  SET new_array = new_array + value
  SET iterator  = iterator + 2

PRINT new_array

END 










