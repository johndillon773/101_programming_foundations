statement = "The Flintstones Rock"
frequency = {}

statement.each_char do |letter|
  if ('A'..'Z').include?(letter) || ('a'..'z').include?(letter)
    frequency[letter] = statement.count(letter)
  end
end