def prompt(message)
  puts("=> #{message}")
end

prompt("Welcome to the Mortgage Calculator.")

loop do
  prompt("Please enter a loan amount.")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Please enter an Annual Percentage Rate (APR).")
  prompt("Use 4.5 for 4.5%, for example.")

  apr = ''
  loop do
    apr = gets.chomp

    if apr.empty? || apr.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("Please enter a loan duration in years.")

  duration_years = ''
  loop do
    duration_years = gets.chomp

    if duration_years.empty? || duration_years.to_f < 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  monthly_rate = apr.to_f / 12 / 100
  duration_months = duration_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**(-duration_months)))

  prompt("Your monthly payment will be $#{format('%02.2f', monthly_payment)}")
  prompt("Would you like to do another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using the loan calculator! Goodbye.")
