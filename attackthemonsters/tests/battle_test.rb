require "test/unit"
require_relative '../battle'
require_relative '../player'
require_relative '../monster'
require_relative '../turn'
require_relative '../monster_types/animal_monster'
require_relative '../monster_types/humanoid_monster'
require_relative '../monster_types/golem_monster'
require_relative '../weapons/axe'
require_relative '../weapons/barehand'
require_relative '../weapons/knife'
require_relative '../weapons/sword'

class BattleTest < Test::Unit::TestCase
  def perform
    battle = Battle.new.perform
  end
end