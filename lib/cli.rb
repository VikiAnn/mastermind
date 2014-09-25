require 'pry'

class CLI
  attr_reader :command,
              :printer,
              :stdout,
              :game

  def initialize(stdout)
    @command = ""
    @printer = MessagePrinter.new(stdout)
    @stdout = stdout
  end

  def start
    printer.welcome
    printer.initial_options
    until quit?
      @command = gets.strip
      case
      when instructions?
        printer.instructions
      when play?
        @game = Game.new(stdout)
        game.play
        if game.won?
          printer.ask_play_again
        elsif game.lost?
          printer.at_max_guesses
          printer.ask_play_again
        elsif game.quit?
          @command = "q"
        end
      end
      printer.goodbye if quit?
    end
  end

  def game_stuff
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
