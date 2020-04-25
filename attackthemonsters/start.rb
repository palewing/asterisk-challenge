require_relative 'config'
require_relative 'battle'
require_relative 'player'
require_relative 'monster'
require_relative 'turn'
require_relative 'weapon_list'
require_relative 'monster_type_list'

Dir["#{Dir.pwd}/monster_types/*.rb"].each { |file| require file }
Dir["#{Dir.pwd}/weapons/*.rb"].each { |file| require file }

battle = Battle.new.perform