class GolemMonster
  def self.name
    ['grog', 'marg', 'birb'].sample
  end

  def self.modifier
    { hp: 0.2, at: 0, df: 2, cc: 0 }
  end
end