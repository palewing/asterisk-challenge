class AnimalMonster
  def self.name
    ['grog', 'marg', 'birb'].sample
  end

  def self.modifier
    { hp: 0.1, at: 1, df: 0, cc: 0 }
  end
end