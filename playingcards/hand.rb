class Hand
  attr_accessor :my_hand

  def initialize(cards)
    @cards = cards
    @my_hand = sort
    self
  end

  def sort
    my_hand = Array.new(52)
    @cards.each { |card| my_hand[card.indeks] = card }
    my_hand.compact
  end

  def rating(rule)
    rule.new(@my_hand).rate
  end
end