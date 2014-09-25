class GuessManager
  attr_reader :guesses,
              :sequence,
              :max_guesses

  def initialize(sequence, stdout)
    @guesses = []
    @sequence = sequence
    @max_guesses = 10
  end

  def at_max_guesses?
    count >= max_guesses
  end

  def count
    @guesses.count
  end

  def add_guess(guess)
    @guesses << guess.downcase
  end

  def correct_elements
    correct_elements = 0
    guess = @guesses.last.chars
    sequence.each_char do |color|
      index = guess.index(color)
      if index
        guess.delete_at(index)
        correct_elements += 1
      end
    end
    correct_elements
  end

  def correct_positions
    correct_positions = 0
    guess = @guesses[-1]
    guess.chars.zip(sequence.chars).each do |pair|
      correct_positions += 1 if pair[0] == pair[1]
    end
    correct_positions
  end
end
