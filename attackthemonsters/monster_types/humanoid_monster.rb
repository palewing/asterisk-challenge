Dir["../weapons/*.rb"].each {|file| require file }

class HumanoidMonster
  def self.name
    ('a'..'z').to_a.shuffle[0,5].join
  end

  def self.modifier
    { hp: 0.1, at: 1, df: 1, cc: 0 }
  end

  def self.weapon
    # weapon_lists.sample
    [Axe, Barehand, Knife, Sword].sample
  end

  def self.weapon_lists
    weapons_names = Dir["../weapons/*.rb"].each { |file| file }.map do |dir|
                      dir.split(/(?:..\/weapons\/|.rb)/)[1].modulize
                    end
    weapons_names.map do |weapon_name|
      Object.const_get(weapon_name)
    end
  end

  def modulize
    gsub(/__(.?)/){ "::#{$1.upcase}" }.
    gsub(/\/(.?)/){ "::#{$1.upcase}" }.
    gsub(/(?:_+|-+)([a-z])/){ $1.upcase }.
    gsub(/(\A|\s)([a-z])/){ $1 + $2.upcase }
  end
end