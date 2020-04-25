class Player
  attr_accessor :name, :attribute, :weapon

  def initialize(name: nil, weapon: nil, hitpoint: 1, attack: 1, defence: 1)
    @name = name
    @weapon = weapon
    @attribute = { hp: hitpoint, at: attack, df: defence, cc: 0 }

    update_attibute(@weapon.modifier)
  end

  def update_attibute(modifier)
    @attribute[:hp] = @attribute[:hp] * modifier[:hp] + @attribute[:hp]
    @attribute[:at] += modifier[:at]
    @attribute[:df] += modifier[:df]
    @attribute[:cc] += modifier[:cc]
  end

  def alive?
    @attribute[:hp] > 0
  end
end