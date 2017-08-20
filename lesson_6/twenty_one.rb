CARDS = ['2', '3', '4', '5',
         '6', '7', '8', '9',
         '10', 'Jack', 'Queen', 'King', 'Ace']

CARD_VALUES = { '2' => 2,   '3' => 3,     '4' => 4,      '5'    => 5,
                '6' => 6,   '7' => 7,     '8' => 8,      '9'    => 9,
                '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10 }

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  new_deck = CARDS * 4
  new_deck.shuffle
end

def deal(deck)
  hand = []
  2.times { hand << deck.pop }
  hand
end

def total(arr)
  total = 0

  arr.select { |card| card != 'Ace' }.each do |card|
    total += CARD_VALUES[card]
  end

  aces = arr.count('Ace')
  if aces > 0
    if total <= (11 - aces)
      total += (10 + aces)
    else
      total += aces
    end
  end

  total
end

def busted?(hand)
  total(hand) > 21
end

def detect_result(d_total, p_total)
  if d_total > 21
    :dealer_busted
  elsif p_total > 21
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

def play_again?
  puts '------------'
  prompt('Would you like to play again (y or n)?')
  answer = gets.chomp.downcase
  answer.start_with?('y')
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

player_wins = 0
dealer_wins = 0

loop do
  prompt('Welcome to Twenty-One!')

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
    play_again? ? next : break
  else
    prompt("You stayed at #{player_total}")
  end

  # dealer turn
  prompt('Dealer turn...')

  loop do
    break if total(dealer_hand) >= 17
    prompt('Dealer hits!')
    dealer_hand << the_deck.pop
    dealer_total = total(dealer_hand)
    prompt("Dealer now has #{dealer_total}")
  end

  if busted?(dealer_hand)
    end_round(dealer_hand, player_hand, dealer_total, player_total)
    play_again? ? next : break
  else
    prompt("Dealer stays at #{dealer_total}")
  end

  end_round(dealer_hand, player_hand, dealer_total, player_total)

  break unless play_again?
end

prompt('Thanks for playing Twenty-One! Goodbye!')
