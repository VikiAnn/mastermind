class MessagePrinter
  attr_reader :current_message

  def print
    puts current_message
  end

  def at_max_guesses
    @current_message = "Sorry, you've run out of guesses"
  end

  def correct_guess
    @current_message = "You've guessed the correct sequence!"
  end

  def incorrect_guess(correct_elements, correct_positions, count)
    @current_message = "You guessed #{correct_elements} correct colors with #{correct_positions} in the correct position. \nYou've made #{count} guesses."
  end
end
