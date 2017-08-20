
# -generate random 8-digit string
# -generate random 4-digit string (times 4)
# -generate random 12 digit string
# -push strings to hash
# -join hash with '-'
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

def uuid_generator
  arr = ['', '', '', '', '']
  8.times { arr[0] << DIGITS[rand(0..15)] }
  3.times do |i|
    4.times do
      arr[i + 1] << DIGITS[rand(0..15)]
    end
  end
  12.times { arr[4] << DIGITS[rand(0..15)] }
  uuid = arr.join('-')
  p uuid
end

uuid_generator