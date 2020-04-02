require "test/unit"
require_relative '../card'
require_relative '../hand'
require_relative '../holdem_rule'

class HoldemRuleTest < Test::Unit::TestCase
  def test_royal_flush
    cards = [Card.new('♥','A'),Card.new('♥','10'),Card.new('♥','J'),Card.new('♥','Q'),Card.new('♥','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Royal flush', rating, "should return Royal flush"
  end

  def test_straight_flush
    cards = [Card.new('♥','A'),Card.new('♥','2'),Card.new('♥','J'),Card.new('♥','Q'),Card.new('♥','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Straight flush', rating, "should return Straight flush"
  end

  def test_four_of_a_kind
    cards = [Card.new('♣','5'),Card.new('♣','K'),Card.new('♦','K'),Card.new('♥','K'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Four of a kind', rating, "should return Four of a kind"
  end

  def test_full_house
    cards = [Card.new('♣','5'),Card.new('♦','5'),Card.new('♦','K'),Card.new('♥','K'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Full house', rating, "should return Full house"
  end

  def test_flush
    cards = [Card.new('♥','A'),Card.new('♥','4'),Card.new('♥','J'),Card.new('♥','Q'),Card.new('♥','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Flush', rating, "should return Flush"
  end

  def test_straight
    cards = [Card.new('♥','3'),Card.new('♦','4'),Card.new('♥','5'),Card.new('♥','6'),Card.new('♥','7')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Straight', rating, "should return Straight"
  end

  def test_three_of_a_kind
    cards = [Card.new('♣','5'),Card.new('♦','4'),Card.new('♦','K'),Card.new('♥','K'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Three of a kind', rating, "should return Three of a kind"
  end

  def test_two_pairs
    cards = [Card.new('♣','5'),Card.new('♦','5'),Card.new('♦','7'),Card.new('♥','K'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Two pairs', rating, "should return Two pairs"
  end

  def test_pair
    cards = [Card.new('♣','5'),Card.new('♦','5'),Card.new('♦','7'),Card.new('♥','8'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Pair', rating, "should return Pair"
  end

  def test_highcard
    cards = [Card.new('♣','5'),Card.new('♦','7'),Card.new('♦','10'),Card.new('♥','J'),Card.new('♠','K')]
    rating = Hand.new(cards).rating(HoldemRule)

    assert_equal 'Highcard', rating, "should return Highcard"
  end
end