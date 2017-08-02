flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flinstones.each_with_index do |name, index|
  if name.first(2) == 'Be'
    return index
  end
end

# solution:

flinstones.index { |name| name[0, 2] == 'Be' }