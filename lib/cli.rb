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
    process_initial_commands
  end

  def process_initial_commands
    until quit?
      @command = gets.strip
      case
      when instructions?
        printer.instructions
      when play?
        @game = Game.new(stdout, printer)
        game.play
        if game.quit?
          @command = "q"
        end
      end
      printer.goodbye if quit?
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
