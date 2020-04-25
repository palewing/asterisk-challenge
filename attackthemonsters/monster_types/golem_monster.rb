class GolemMonster
  def self.name
    ('a'..'z').to_a.shuffle[0,5].join
  end

  def self.modifier
    { hp: 0.2, at: 0, df: 2, cc: 0 }
  end

  def self.weapon
    Barehand
  end
end