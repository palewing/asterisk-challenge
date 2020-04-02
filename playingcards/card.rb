class Card
  attr_accessor :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def name
    "#{@rank}#{suit}"
  end

  def indeks
    indeks_helper[name]
  end

  def indeks_helper
    {"A♣"=>0,"A♦"=>1,"A♥"=>2,"A♠"=>3,"2♣"=>4,"2♦"=>5,"2♥"=>6,"2♠"=>7,"3♣"=>8,"3♦"=>9,"3♥"=>10,"3♠"=>11,"4♣"=>12,"4♦"=>13,"4♥"=>14,"4♠"=>15,"5♣"=>16,"5♦"=>17,"5♥"=>18,"5♠"=>19,"6♣"=>20,"6♦"=>21,"6♥"=>22,"6♠"=>23,"7♣"=>24,"7♦"=>25,"7♥"=>26,"7♠"=>27,"8♣"=>28,"8♦"=>29,"8♥"=>30,"8♠"=>31,"9♣"=>32,"9♦"=>33,"9♥"=>34,"9♠"=>35,"10♣"=>36,"10♦"=>37,"10♥"=>38,"10♠"=>39,"J♣"=>40,"J♦"=>41,"J♥"=>42,"J♠"=>43,"Q♣"=>44,"Q♦"=>45,"Q♥"=>46,"Q♠"=>47,"K♣"=>48,"K♦"=>49,"K♥"=>50,"K♠"=>51}
  end
end
