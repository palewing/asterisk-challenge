class Human
  attr_accessor :name, :attribute, :weapon

  def initialize(name, weapon, hitpoint, attack, defence)
    @name = name
    @attribute = { hp: hitpoint, at: attack, df: defence, cc: 0 }

    update_attribute(weapon.modifier)
  end

  def update_attribute(modifier)
    @attribute[:hp] = @attribute[:hp] * modifier[:hp] + @attribute[:hp]
    @attribute[:at] += modifier[:at]
    @attribute[:df] += modifier[:df]
    @attribute[:cc] += modifier[:cc]
  end
end