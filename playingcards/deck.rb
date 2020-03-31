class Deck
  attr_accessor :cards

  def initialize(suits, ranks)
    @suits = suits
    @ranks = ranks
    @cards = []
  end

  def generate
    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def print
    @cards.map(&:print)
  end

  def shuffle
    @cards.shuffle!
  end
end