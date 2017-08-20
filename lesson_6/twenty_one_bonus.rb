CARDS = { '2' => 2,   '3' => 3,     '4' => 4,      '5'    => 5,
          '6' => 6,   '7' => 7,     '8' => 8,      '9'    => 9,
          '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10,
          'Ace' => 11 }

DEALER_LIMIT = 17
BLACKJACK = 21
GAMES_TO_WIN = 5

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = CARDS.keys * 4
  new_deck.shuffle
end

def deal(deck)
  hand = []
  2.times { hand << deck.pop }
  hand
end

def total(hand)
  total = 0

  hand.each do |card|
    total += CARDS[card]
  end

  hand.select { |card| card == "Ace" }.count.times do
    total -= 10 if total > BLACKJACK
  end

  total
end

def busted?(hand)
  total(hand) > BLACKJACK
end

def detect_result(d_total, p_total)
  if d_total > BLACKJACK
    :dealer_busted
  elsif p_total > BLACKJACK
    :player_busted
  elsif d_total > p_total
    :dealer_won
  elsif p_total > d_total
    :player_won
  else
    :tie
  end
end

def display_results(d_total, p_total)
  result = detect_result(d_total, p_total)

  case result
  when :dealer_busted
    prompt('Dealer busted! You win!')
  when :player_busted
    prompt('You busted! Dealer wins!')
  when :dealer_won
    prompt('Dealer wins!')
  when :player_won
    prompt('You win!')
  when :tie
    prompt('It\'s a tie!')
  end
end

def increment_score(d_total, p_total, score)
  winner = detect_result(d_total, p_total)

  case winner
  when :player_busted, :dealer_won
    score[:dealer] = score[:dealer] + 1
  when :dealer_busted, :player_won
    score[:player] = score[:player] + 1
  end

  prompt("Dealer score: #{score[:dealer]}")
  prompt("Player score: #{score[:player]}")
  puts'============'
end

def champion?(score)
  score[:dealer] == GAMES_TO_WIN || score[:player] == GAMES_TO_WIN
end

def display_champion(score)
  if score[:dealer] == GAMES_TO_WIN
    prompt('Dealer is the grand champion!')
  elsif score[:player] == GAMES_TO_WIN
    prompt('You are the grand champion!')
  end
  puts '------------'
  prompt('Thanks for playing Twenty-One! Goodbye!')
end

def end_round(d_hand, p_hand, d_total, p_total)
  puts '============'
  prompt("Dealer has #{d_hand.join(', ')}, "\
         "for a total of #{d_total}")
  prompt("You have #{p_hand.join(', ')}, "\
         "for a total of #{p_total}")
  puts '============'
  display_results(d_total, p_total)
end

score = { player: 0, dealer: 0 }

puts '============'
prompt('Welcome to Blackjack!')
prompt("Blackjack is #{BLACKJACK}")
prompt("Dealer limit is #{DEALER_LIMIT}")
prompt("First to #{GAMES_TO_WIN} wins it all!")
puts '============'

loop do
  the_deck = initialize_deck

  player_hand = deal(the_deck)
  dealer_hand = deal(the_deck)

  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  prompt("Dealer has #{dealer_hand[0]} and ?")
  prompt("You have #{player_hand[0]} and #{player_hand[1]}, "\
         "for a total of #{player_total}")

  # player turn
  loop do
    player_turn = nil
    loop do
      prompt('Would you like to (h)it or (s)tay?')
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)
      prompt("You must eneter 'h' or 's'")
    end

    if player_turn == 'h'
      prompt("You chose to hit!")
      player_hand << the_deck.pop
      player_total = total(player_hand)
      prompt("Your cards are now #{player_hand.join(', ')}")
      prompt("Your total is now #{player_total}")
      break if busted?(player_hand)
    end

    break if player_turn == 's'
  end

  if busted?(player_hand)
    end_round(dealer_hand, player_hand, dealer_total, player_total)
    increment_score(dealer_total, player_total, score)
    champion?(score) ? break : next
  else
    prompt("You stayed at #{player_total}")
  end

  # dealer turn
  prompt('Dealer turn...')

  loop do
    break if total(dealer_hand) >= DEALER_LIMIT
    prompt('Dealer hits!')
    dealer_hand << the_deck.pop
    dealer_total = total(dealer_hand)
    prompt("Dealer now has #{dealer_total}")
  end

  if busted?(dealer_hand)
    end_round(dealer_hand, player_hand, dealer_total, player_total)
    increment_score(dealer_total, player_total, score)
    champion?(score) ? break : next
  else
    prompt("Dealer stays at #{dealer_total}")
  end

  end_round(dealer_hand, player_hand, dealer_total, player_total)
  increment_score(dealer_total, player_total, score)
  break if champion?(score)
end

display_champion(score)
