VALID_CHOICES = %w(rock paper scissors lizard spock)

WINNERS = { rock:     %w(lizard scissors),
            paper:    %w(rock spock),
            scissors: %w(paper lizard),
            lizard:   %w(paper spock),
            spock:    %w(scissors rock) }

player_score = 0
computer_score = 0

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  prompt("You chose #{player}; computer chose #{computer}")

  if WINNERS[player.to_sym].include?(computer)
    prompt("You won!")
  elsif WINNERS[computer.to_sym].include?(player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

prompt("Welcome to #{VALID_CHOICES.join(', ')}!")
prompt("First to five games wins.")

loop do
  choice = ''
  loop do
    prompt("Choose one: rock (r), paper (p),\
 scissors (sc), lizard (l), spock (sp)open")
    choice = gets.chomp.downcase

    choice = case choice
             when 'r'
               'rock'
             when 'p'
               'paper'
             when 'sc'
               'scissors'
             when 'l'
               'lizard'
             when 'sp'
               'spock'
             end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  if WINNERS[choice.to_sym].include?(computer_choice)
    player_score += 1
  elsif WINNERS[computer_choice.to_sym].include?(choice)
    computer_score += 1
  end

  prompt("Your score: #{player_score}")
  prompt("Computer score: #{computer_score}")

  if player_score == 5
    prompt("You are the grand winner!")
    break
  elsif computer_score == 5
    prompt("Sorry, the computer is the grand winner!")
    break
  end
end

prompt("Thanks for playing. Goodbye!")
