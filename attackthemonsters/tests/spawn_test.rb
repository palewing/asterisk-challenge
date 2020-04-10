require "test/unit"
require_relative '../monster'
require_relative '../animal_monster'
require_relative '../human'
require_relative '../knife'
require_relative '../sword'
require_relative '../axe'
require_relative '../barehand'
require_relative '../humanoid_monster'

class MonsterTest < Test::Unit::TestCase
  def test_monster_spawn
    animal_monster = Monster.new(AnimalMonster, 30, 3, 0)
    expected_attribute = { hp: 33, at: 4, df: 0, cc: 0 }

    assert_not_nil animal_monster.name, 'Monster has preconfigured name'
    assert_equal expected_attribute, animal_monster.attribute, 'Type modifies attribute'
  end

  def test_human_spawn
    human = Human.new('Adam', Knife, 20, 5, 1)
    expected_attribute = { hp: 20, at: 6, df: 1, cc: 0.3 }

    assert_equal 'Adam', human.name, 'Human name equal input'
    assert_equal expected_attribute, human.attribute, 'Weapon modifies attribute'
  end

  def test_humanoid_spawn
    humanoid = HumanoidMonster.new(40, 2, 3)
    weapon = humanoid.weapon
    expected_attribute = { hp: 44, at: 3 + weapon.modifier[:at], df: 4 + weapon.modifier[:df], cc: 0 + weapon.modifier[:cc] }

    assert_not_nil humanoid.name, 'Humanoid monster has preconfigured name'
    assert_not_nil humanoid.weapon, 'Humanoid monster has preconfigured weapon'
    assert_equal expected_attribute, humanoid.attribute, 'Weapon & type modifies attribute'
  end
end