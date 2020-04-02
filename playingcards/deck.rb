class Deck
  attr_accessor :cards

  def initialize
    @suits = ["♣", "♦", "♥", "♠"]
    @ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    @cards = []
    self
  end

  def generate
    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    self
  end

  def print
    @cards.map(&:print)
  end

  def shuffle
    @cards.shuffle!
    self
  end

  def draw
    @cards.slice(0,5)
  end
end