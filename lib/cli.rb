class CLI
  attr_reader :command, :printer, :stdout

  def initialize(stdout)
    @command = ""
    @printer = MessagePrinter.new(stdout)
    @stdout = stdout
    # binding.pry
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
        game = Game.new(stdout)
        game.play
      end
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
