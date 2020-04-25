class HumanoidMonster
  def self.name
    ('a'..'z').to_a.shuffle[0,5].join
  end

  def self.modifier
    { hp: 0.1, at: 1, df: 1, cc: 0 }
  end

  def self.weapon
    WeaponList.generate.sample
  end
end