require "test/unit"
require_relative '../player'
require_relative '../monster'
require_relative '../monster_types/animal_monster'
require_relative '../monster_types/humanoid_monster'
require_relative '../weapons/axe'
require_relative '../weapons/barehand'
require_relative '../weapons/knife'
require_relative '../weapons/sword'

class MonsterTest < Test::Unit::TestCase
  def test_monster_spawn
    animal_monster = Monster.new(type: AnimalMonster, hitpoint: 30, attack: 3, defence: 0)
    expected_attribute = { hp: 33, at: 4, df: 0, cc: 0 }

    assert_not_nil animal_monster.name, 'Monster has preconfigured name'
    assert_equal Barehand, animal_monster.weapon, 'Non-humanoid monster fight without weapon (barehand)'
    assert_equal expected_attribute, animal_monster.attribute, 'Type modifies attribute'
  end

  def test_player_spawn
    player = Player.new(name:'Adam', weapon: Knife, hitpoint: 20, attack: 5, defence: 1)
    expected_attribute = { hp: 20, at: 6, df: 1, cc: 0.3 }

    assert_equal 'Adam', player.name, 'Player name equal input'
    assert_equal expected_attribute, player.attribute, 'Weapon modifies attribute'
  end

  def test_humanoid_monster_spawn
    humanoid = Monster.new(type: HumanoidMonster, hitpoint: 30, attack: 3, defence: 0)

    weapon = humanoid.weapon
    expected_attribute = { hp: 33, at: 4 + weapon.modifier[:at], df: 1 + weapon.modifier[:df], cc: 0 + weapon.modifier[:cc]}

    assert_not_nil humanoid.name, 'Monster has preconfigured name'
    assert_not_nil humanoid.weapon, 'Humanoid monster can either use weapon or barehand'
    assert_equal expected_attribute, humanoid.attribute, 'Type & weapon modifies attribute'
  end
end