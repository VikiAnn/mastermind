require 'pry'
class CLI
  attr_reader :command, :guess, :sequence, :guess_manager, :printer

  def initialize(stdout)
    @command = ""
    @printer = MessagePrinter.new(stdout)
    @stdout = stdout
  end

  def start
    printer.welcome
    until quit?
      printer.initial_options
      @command = gets.strip
      case
      when instructions?
        printer.instructions
      when play?
        printer.start_game_message
        @sequence = Sequence.new.secret
        @guess = ""
        @guess_manager = GuessManager.new(sequence, @stdout)
        game_loop
      end
    end
  end

  def game_loop
    until won? || lost? || quit?
      printer.guess_prompt
      @command = gets.strip
      @guess = command
      guess_manager.guess(guess)
    end
    if lost?
      printer.at_max_guesses
    end
  end

  def won?
    guess == sequence
  end

  def lost?
    guess_manager.at_max_guesses?
  end

  def quit?
    command == "q" || command == "quit"
  end

  def instructions?
    command == "i" || command == "instructions"
  end

  def play?
    command == "p" || command == "play"
  end
end
