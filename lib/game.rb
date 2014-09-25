class Game
  attr_reader :printer,
              :sequence,
              :guess,
              :guess_manager,
              :command,
              :game_time

  def initialize(stdout)
    @stdout = stdout
    @printer = MessagePrinter.new(stdout)
    @game_time = GameTime.new
  end

  def play
    game_time.start
    printer.start_game_message
    @sequence = Sequence.new.secret
    @guess = ""
    @guess_manager = GuessManager.new(sequence, @stdout)
    take_turn until over?
  end

  def take_turn
    printer.guess_prompt
    @command = gets.strip
    if guess?
      @guess = command
      guess_manager.add_guess(guess)
      if won?
        win_sequence
      else
        feedback
      end
    end
  end

  def win_sequence
    game_time.stop
    printer.won(game_time.total, sequence)
  end

  def feedback
    printer.feedback(guess,
                     guess_manager.correct_elements,
                     guess_manager.correct_positions,
                     guess_manager.count)
  end

  def guess?
    (@command.length == 4)
  end

  def over?
    won? || lost? || quit?
  end

  def quit?
    command == "q" || command == "quit"
  end

  def won?
    guess == sequence
  end

  def play_again?
    command == "p" || command == "play"
  end

  def lost?
    guess_manager.at_max_guesses?
  end
end
