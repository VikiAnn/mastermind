# require_relative 'message_printer'

class GuessManager
  attr_reader :guesses, :sequence, :max_guesses, :printer

  def initialize(sequence, stdout)
    @guesses = []
    @sequence = sequence
    @max_guesses = 10
    @printer = MessagePrinter.new(stdout)
  end

  def at_max_guesses?
    count >= max_guesses
  end

  def count
    @guesses.count
  end

  def guess(guess)
    @guesses << guess
    if correct_guess?
      printer.correct_guess
    elsif !correct_guess?
      printer.incorrect_guess(correct_elements, correct_positions, count)
      [correct_elements, correct_positions]
    end
  end

  def correct_guess?
    @guesses[-1] == sequence
  end

  def correct_elements
    correct_elements = 0
    guess = @guesses.last.chars.sort
    answer = sequence.chars.sort
    answer.each do |color|
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
