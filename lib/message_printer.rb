class MessagePrinter
  attr_reader :current_message

  def initialize(stdout)
    @stdout = stdout
  end

  def print_message
    @stdout.puts current_message
  end

  def welcome
    @current_message = "Welcome to MASTERMIND."
    print_message
  end

  def initial_options
    @current_message = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print_message
  end

  def instructions
    @current_message = "I've made a secret code of (r)ed, (g)reen, (b)lue and (y)ellow dots.\nYou get 10 tries to guess the code.\nYou may enter guesses in the form yyrg."
    print_message
  end

  def start_game_message
    @current_message = "Starting a game of Mastermind.\nI've generated a secret code.\nYour guess can include (r)ed, (y)ellow, (g)reen, or (b)lue."
    print_message
  end

  def guess_prompt
    @current_message = "Enter your guess:"
    print_message
  end

  def at_max_guesses
    @current_message = "Sorry, you've run out of guesses"
    print_message
  end

  def correct_guess
    @current_message = "You've guessed the correct sequence!"
    print_message
  end

  def incorrect_guess(guess, correct_elements, correct_positions, count)
    @current_message = "'#{guess.upcase}' has #{correct_elements} correct colors with #{correct_positions} in the correct position. \nYou've made #{count} guesses."
    print_message
  end

  def won(seconds_taken, sequence)
    @current_message = "Congratulations, you won!\nYou guessed the sequence '#{sequence.upcase}' in #{seconds_taken}."
    print_message
  end
end
