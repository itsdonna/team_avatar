class API
    BASE_URL = "https://last-airbender-api.herokuapp.com/api/v1/characters"
    def self.get_team_avatar
        response = RestClient.get(BASE_URL + "team_avatar/")
        binding.pry
    end

    
end

API.get_team_avatar