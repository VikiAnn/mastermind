class Sequence
  attr_reader :secret

  def initialize
    colors = [
      "r", "r", "r", "r",
      "g", "g", "g", "g",
      "y", "y", "y", "y",
      "b", "b", "b", "b"
      ]

    @secret = colors.shuffle.take(4).join("")
  end
end
