require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operation_to_message(op)
  word = case op
         when '1'
           MESSAGES[operator_add]
         when '2'
           MESSAGES[operator_subtract]
         when '3'
           MESSAGES[operator_multiply]
         when '4'
           MESSAGES[operator_divide]
         end
  word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt(MESSAGES['greeting'])

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  prompt(MESSAGES['processing'])

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt(MESSAGES['result'])

  prompt(MESSAGES['do_again?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
