require 'pry'
class CLI
  attr_reader :command, :guess, :sequence, :guess_manager, :printer

  def initialize
    @command = ""
    @printer = MessagePrinter.new
  end

  def start
    puts "Welcome to MASTERMIND."
    until quit?
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
      @command = gets.strip
      case
      when instructions?
        puts "I've made a secret code of (r)ed, (g)reen, (b)lue and (y)ellow dots."
        puts "You get 8 tries to guess the code."
        puts "You may enter guesses in the form yyrg."
      when play?
        puts "Starting a game of Mastermind."
        puts "I've generated a secret code."
        puts "Your guess can include (r)ed, (y)ellow, (g)reen, or (b)lue."
        @sequence = Sequence.new.secret
        @guess = ""
        @guess_manager = GuessManager.new(sequence)
        game_loop
      end
    end
  end

  def game_loop
    until won? || lost? || quit?
      puts "Enter your guess:"
      @command = gets.strip
      @guess = command
      guess_manager.guess(guess)
    end
    if lost?
      printer.at_max_guesses
      printer.print
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
