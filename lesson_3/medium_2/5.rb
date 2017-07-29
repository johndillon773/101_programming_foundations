def color_valid(color)
  case
  when "blue" || "green"
    true
  else
    false
  end
end

# solution:

def color_valid(color)
  color == "blue" || color == "green"
end