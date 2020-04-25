class Battle
  attr_accessor :player, :monster, :turn

  def initialize
    @player = spawn_player
    @monster = spawn_monster
    @turn = Turn.new([@player, @monster])
    self
  end

  def perform
    puts "#{@player.inspect}"
    puts "#{@monster.inspect}"
    puts '------------------------------------------------------------------------'
    flip_coin
    fight
  end

  def fight
    while @turn.attacker.alive? do
      puts "#{@turn.attacker.name} attacks #{@turn.defender.name}!"

      damage = calculate_damage(@turn.attacker, @turn.defender)
      decrease_hp(@turn.defender, damage)

      puts "#{@turn.defender.name} receives #{damage} damage, remaining hp #{@turn.defender.attribute[:hp]}"

      @turn.next
    end
    puts "#{@turn.attacker.name} is dead!"
    puts "#{@turn.defender.name} wins!"
  end

  def calculate_damage(attacker, defender)
    return attacker.attribute[:at] * 2 if critical?(attacker.attribute[:cc])

    percentage = defender.attribute[:df] / attacker.attribute[:at]
    blocked_percentage = defender.attribute[:df] < attacker.attribute[:at] ? percentage * 0.5 : 0.5
    attacker.attribute[:at] - (attacker.attribute[:at] * blocked_percentage)
  end

  def critical?(crit_chance)
    return false if crit_chance < rand

    puts 'It\'s a critical hit!'
    true
  end

  def decrease_hp(defender, damage)
    defender.attribute[:hp] = [defender.attribute[:hp] - damage, 0].max
  end

  def spawn_player
    name = ['Asterisk', 'Groot', 'Natalia', 'Vikings', 'Spaghetti'].sample
    weapon = WeaponList.generate.sample

    Player.new(name: name, weapon: weapon, hitpoint: rand_attr[:hp], attack: rand_attr[:at], defence: rand_attr[:df])
  end

  def spawn_monster
    type = MonsterTypeList.generate.sample

    Monster.new(type: type, hitpoint: rand_attr[:hp], attack: rand_attr[:at], defence: rand_attr[:df])
  end

  def flip_coin
    @turn.shuffle
    puts "#{@turn.attacker.name} gets the first turn"
  end

  def rand_attr
    { hp: rand(20)+1, at: rand(10)+1, df: rand(10)+1 }
  end
end
