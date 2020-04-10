class HumanoidMonster
  attr_accessor :name, :attribute, :weapon, :type

  def initialize(hitpoint, attack, defence)
    @name = HumanoidMonster.name
    @weapon = [Sword, Axe, Knife, Barehand].sample
    @attribute = { hp: hitpoint, at: attack, df: defence, cc: 0 }

    update_attribute(HumanoidMonster.modifier)
    update_attribute(@weapon.modifier)
  end

  def update_attribute(modifier)
    @attribute[:hp] = @attribute[:hp] * modifier[:hp] + @attribute[:hp]
    @attribute[:at] += modifier[:at]
    @attribute[:df] += modifier[:df]
    @attribute[:cc] += modifier[:cc]
  end

  def self.name
    ['grog', 'marg', 'birb'].sample
  end

  def self.modifier
    { hp: 0.1, at: 1, df: 1, cc: 0 }
  end
end