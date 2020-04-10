class Monster
  attr_accessor :type, :name, :attribute

  def initialize(type, hitpoint, attack, defence)
    @type = type
    @name = @type.name
    @attribute = { hp: hitpoint, at: attack, df: defence, cc: 0 }

    update_attribute(@type.modifier)
  end

  def update_attribute(modifier)
    @attribute[:hp] = @attribute[:hp] * modifier[:hp] + @attribute[:hp]
    @attribute[:at] += modifier[:at]
    @attribute[:df] += modifier[:df]
    @attribute[:cc] += modifier[:cc]
  end

end