# take an array, an optionl punctuation mark, and an optional word
# join the array into a string, with the pucntuation between each item 
# and the word before the last item

def joiner(arr, delimiter = ', ', word = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
  all_but_last = arr[0, arr.length - 1].join(delimiter)
  "#{all_but_last}#{delimiter}#{word} #{arr[-1]}"
  end
end


p joiner([1, 2])                   # => "1 or 2"
p joiner([1, 2, 3])                # => "1, 2, or 3"
p joiner([1, 2, 3], '; ')          # => "1; 2; or 3"
p joiner([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"