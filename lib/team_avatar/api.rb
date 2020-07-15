class API
    BASE_URL = "https://last-airbender-api.herokuapp.com/api/v1/characters/avatar"

    def self.get_team_avatar
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)

        
        data.each do |team_avatar_data|
            name = team_avatar_data["name"]
            enemies = team_avatar_data["enemies"]
            affiliation = team_avatar_data["affiliation"]
            Team_Avatar.new(name: name, affiliation: affiliation, enemies: enemies)
            
        end
    end
end
   
            
            
    
     
    
