class WeaponList
  def self.generate
    weapons_names = Dir["#{Dir.pwd}/weapons/*.rb"].each { |file| file }.map do |dir|
                      dir.split(/(?:..\/weapons\/|.rb)/)[1].modulize
                    end
    weapons_names.map do |weapon_name|
      Object.const_get(weapon_name)
    end
  end
end