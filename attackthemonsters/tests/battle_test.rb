require "test/unit"
require_relative '../config'
require_relative '../player'
require_relative '../monster'
require_relative '../battle'
require_relative '../turn'
require_relative '../weapon_list'
require_relative '../monster_type_list'
require_relative '../monster_types/animal_monster'
require_relative '../monster_types/humanoid_monster'
require_relative '../monster_types/golem_monster'
require_relative '../weapons/axe'
require_relative '../weapons/barehand'
require_relative '../weapons/knife'
require_relative '../weapons/sword'

class BattleTest < Test::Unit::TestCase
  def test_spawn
    battle = Battle.new

    assert_not_nil battle.player, 'Has one player'
    assert_not_nil battle.monster, 'Has one monster'
  end

  def test_attacking_turn
    battle = Battle.new

    char_a = battle.turn.attacker
    char_b = battle.turn.defender

    battle.turn.next

    assert_equal char_a, battle.turn.defender, 'Char A is now defender'
    assert_equal char_b, battle.turn.attacker, 'Char B is now attacker'

    battle.turn.next

    assert_equal char_a, battle.turn.attacker, 'Char A is now attacker'
    assert_equal char_b, battle.turn.defender, 'Char B is now defender'
  end

  def test_calculate_damage
    battle = Battle.new

    player = Player.new(name: 'Dummy', weapon: Barehand, hitpoint: 100, attack: 5, defence: 2)
    monster = Monster.new(type: GolemMonster, hitpoint: 100, attack: 4, defence: 0)
    monster_2 = Monster.new(type: GolemMonster, hitpoint: 100, attack: 4, defence: 5)

    player_damage = battle.calculate_damage(player, monster)
    monster_damage = battle.calculate_damage(monster, player)

    assert_equal 4.0, player_damage, 'Blocked percentage proportionate to defence/attack'
    assert_equal 3.0, monster_damage, 'Blocked percentage proportionate to defence/attack'

    player_damage = battle.calculate_damage(player, monster_2)

    assert_equal 2.5, player_damage, 'Blocked percentage is 50% if defence >= attack'

    player.attribute[:cc] = 1
    player_damage = battle.calculate_damage(player, monster)

    assert_equal 10.0, player_damage, 'Critical does 2x damage and can not be blocked'
  end
end