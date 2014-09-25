require 'pry'

class CLI
  attr_reader :command,
              :printer,
              :stdout

  def initialize(stdout)
    @command = ""
    @printer = MessagePrinter.new(stdout)
    @stdout = stdout
  end

  def start
    printer.welcome
    printer.initial_options
    @command = gets.strip
    until quit?
      case
      when instructions?
        printer.instructions
      when play?
        game = Game.new(stdout)
        game.play
      end
      printer.ask_play_again
      @command = gets.strip
    end
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
