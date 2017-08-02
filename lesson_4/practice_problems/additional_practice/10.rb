munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_value do |stats|
  case stats['age']
  when 0..17
    stats['age_group'] = 'kid'
  when 18..64
    stats['age_group'] = 'adult'
  else
    stats['age_group'] = 'senior'
  end
end
