class MonsterTypeList
  def self.generate
    type_names = Dir["#{Dir.pwd}/monster_types/*.rb"].each { |file| file }.map do |dir|
                      dir.split(/(?:..\/monster_types\/|.rb)/)[1].modulize
                    end
    type_names.map do |type_name|
      Object.const_get(type_name)
    end
  end
end