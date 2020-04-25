class Monster
  attr_accessor :name, :type, :weapon, :attribute

  def initialize(type: nil, hitpoint: 1, attack: 1, defence: 1)
    @type = type
    @name = @type.name
    @weapon = @type.weapon
    @attribute = { hp: hitpoint.to_f, at: attack.to_f, df: defence.to_f, cc: 0.0 }

    update_attribute(@type.modifier)
    update_attribute(@weapon.modifier)
  end

  def update_attribute(modifier)
    @attribute[:hp] = @attribute[:hp] * modifier[:hp] + @attribute[:hp]
    @attribute[:at] += modifier[:at]
    @attribute[:df] += modifier[:df]
    @attribute[:cc] += modifier[:cc]
  end

  def alive?
    @attribute[:hp] > 0
  end
end