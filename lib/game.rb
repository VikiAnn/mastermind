class Game
  attr_reader :printer,
              :sequence,
              :guess,
              :guess_manager,
              :command

  def initialize(stdout)
    @stdout = stdout
    @printer = MessagePrinter.new(stdout)
    @game_time = GameTime.new
  end

  def play
    @game_time.start
    printer.start_game_message
    @sequence = Sequence.new.secret
    @guess = ""
    @guess_manager = GuessManager.new(sequence, @stdout)
    game_loop
  end

  def game_loop
    until over?
      printer.guess_prompt
      @command = gets.strip
      @guess = command
      guess_manager.guess(guess)
    end
    if lost?
      printer.at_max_guesses
    elsif won?
      @game_time.stop
      printer.won(@game_time.total, sequence)
    end
  end

  def over?
    won? || lost? || quit?
  end

  def quit?
    command == "q" || command == "quit"
  end

  def won?
    guess_manager.correct_guess?
  end

  def lost?
    guess_manager.at_max_guesses?
  end
end
