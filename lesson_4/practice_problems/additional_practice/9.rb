words = "the flintstones rock"

words_array = words.split

words_array.map! { |word| word.capitalize }

words = words_array.join(' ')

# solution:

words.split.map { |word| word.capitalize }.join(' ')