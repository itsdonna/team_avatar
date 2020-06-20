class Team_Avatar
    attr_accessor :name, :affiliation, :enemies

    @@all = []

    def initialize(name:, affiliation:, enemies:)
        @name = name 
        @affiliation = affiliation
        @enemies = enemies
       
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all  
    end
end



# - name 
# - affliation
# - enemies