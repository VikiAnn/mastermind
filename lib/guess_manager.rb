class GuessManager
  attr_reader :guesses, :sequence
  MAX_GUESSES = 8

  def initialize(sequence)
    @guesses = []
    @sequence = sequence
    @correct_positions = 0
    @correct_elements = 0
  end

  def at_max_guesses?
    count >= MAX_GUESSES
  end

  def count
    @guesses.count
  end

  def guess(guess)
    if !at_max_guesses?
      @guesses << guess
      if correct_guess?
        "You've guessed the correct sequence!"
      elsif !correct_guess?
        [correct_elements, correct_positions]
      end
    else
      "Sorry, you've run out of guesses"
    end
  end

  def correct_elements
    guess = @guesses.last.chars.sort
    answer = sequence.chars.sort
    answer.each do |color|
      index = guess.index(color)
      if index
        guess.delete_at(index)
        @correct_elements += 1
      end
    end
    @correct_elements
  end

  def correct_positions
    guess = @guesses[-1]
    guess.chars.zip(sequence.chars).each do |pair|
      @correct_positions += 1 if pair[0] == pair[1]
    end
    @correct_positions
  end

  def correct_guess?
    @guesses[-1] == sequence
  end
end
