def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block.\n\n"

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer).\n\n"
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block.\n\n"

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block.\n\n" rescue puts "ugh ohhhhh"
end

# predictions:

  # "a_outer is 42 with an id of: A1 before the block."
  # "b_outer is forty two with an id of: B1 before the block."
  # "c_outer is [42] with an id of: C1 before the block."
  # "d_outer is 42 with an id of: D1 before the block.\n\n"
  # 
  # "a_outer id was A1 before the block and is: A1 inside the block."
  # "b_outer id was B1 before the block and is: B1 inside the block."
  # "c_outer id was C1 before the block and is: C1 inside the block."
  # "d_outer id was D1 before the block and is: D1 inside the block.\n\n"
  # 
  # "a_outer inside after reassignment is 22 with an id of: A1 before and: A2 after."
  # "b_outer inside after reassignment is thirty three with an id of: B1 before and: B2 after."
  # "c_outer inside after reassignment is [44] with an id of: C1 before and: C2 after."
  # "d_outer inside after reassignment is 44 with an id of: D1 before and: D2 after.\n\n"
  # 
  # "a_inner is 22 with an id of: A2 inside the block (compared to A2 for outer)."
  # "b_inner is thirty three with an id of: B2 inside the block (compared to B2 for outer)."
  # "c_inner is [44] with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
  # "d_inner is 44 with an id of: D2 inside the block (compared to D2 for outer).\n\n"
  # 
  # Wrong:
  # "a_outer is 42 with an id of: A1 BEFORE and: A1 AFTER the block."
  # "b_outer is forty two with an id of: B1 BEFORE and: B1 AFTER the block."
  # "c_outer is [42] with an id of: C1 BEFORE and: C1 AFTER the block."
  # "d_outer is 42 with an id of: D1 BEFORE and: D1 AFTER the block.\n\n"
  # the variables that were reassigned within the block actually maintain their reassignment outside the block

  # 
  # "ugh ohhhhh"

