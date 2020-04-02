class HoldemRule
  def initialize(cards)
    @cards = cards
    self
  end

  def rate
    return 'Royal flush' if royal_flush?
    return 'Straight flush' if straight_flush?
    return 'Four of a kind' if four_of_a_kind?
    return 'Full house' if full_house?
    return 'Flush' if flush?
    return 'Straight' if straight?
    return 'Three of a kind' if three_of_a_kind?
    return 'Two pairs' if two_pairs?
    return 'Pair' if pair?

    return 'Highcard'
  end

  private

  def royal_flush?
    royal? && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    return true if pair_count[4]

    false
  end

  def full_house?
    pairs = pair_count
    return true if pairs[3] && pairs[2]

    false
  end

  def royal?
    @cards[0].rank == 'A' && @cards[1].rank == '10' && @cards[2].rank == 'J' && @cards[3].rank == 'Q' && @cards[4].rank == 'K'
  end

  def flush?
    suits = @cards.map { |card| card.suit }
    suits.uniq.size == 1
  end

  def straight?
    helper = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    ace_helper = [["A","2", "3", "4", "5"], ["A","2", "3", "4", "K"], ["A","2", "3", "Q", "K"], ["A","2", "J", "Q", "K"], ["A","10", "J", "Q", "K"]]

    if @cards.first.rank == 'A'
      current_hand = @cards.map(&:rank)
      return ace_helper.any? { |list| list == current_hand }
    elsif
      current_index = helper.index(@cards.first.rank)
      @cards.each do |card|
        return false if card.rank != helper[current_index]

        current_index += 1
      end
    end


    true
  end

  def three_of_a_kind?
    return true if pair_count[3]

    false
  end

  def two_pairs?
    pairs = pair_count
    pairs[2] && pairs[2].size == 2
  end

  def pair?
    return true if pair_count[2]

    false
  end

  def pair_count
    @cards.group_by(&:rank).map {|k,v| v.size}.group_by(&:itself)
  end
end