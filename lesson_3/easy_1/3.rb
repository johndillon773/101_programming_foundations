advice = "Few things in life are as important as house training your pet dinosaur."

advice = advice.split(' ')
advice[6] = 'urgent'
advice = advice.join(' ')

p advice

# solution: advice.gsub!('important', 'urgent')