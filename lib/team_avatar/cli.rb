class Cli
    
    def start
        puts "Welcome Team Avatar! Yip, Yip!"
        API.get_team_avatar
        # binding.pry
        print_main_menu
    end

    def print_main_menu
        puts ""
        puts "Menu:"
        puts "Type name to get list a character"
        puts "Type affiliation to get more information"
        puts "Type enemies to get each Avatars enemies."
        puts "Type bye to exit"
        puts ""  
        main_menu
    end

   

    

    def main_menu
        input = gets.strip.downcase

        if input == "name"
                       
            puts ""
            puts "You typed name. Here are some characters"
            print_name
            puts ""
            puts "Enter name to see enemies and affiliation"
            input = gets.strip.downcase
            print_find_by_name(input)
            puts "To go back and get a new character, type \"back\"."
            puts "To exit, type \"bye\"."
            puts "" 
            main_menu


        elsif input == "affiliation"
            puts ""
            puts "You typed affiliation. Here are some affiliations"
            print_affiliation
            puts ""
            puts "To go back and get a new character affiliation, type \"back\"."
            puts "To exit, type \"bye\"."
            puts ""
            main_menu

        elsif input == "enemies"
            puts ""
            puts "You typed enemies. Here are some enemies"
            print_enemies
            puts ""
            puts "To go back and get a new character enemies, type \"back\"."
            puts "To exit, type \"bye\"."
            puts ""
            main_menu

            b_input = gets.strip.downcase
            if b_input == "back"
                new_options
                print_main_menu
            elsif b_input == "bye"
                bye
            else
                invalid_input
                print_main_menu
            end
        elsif input == "bye"
            bye
        else
            invalid_input
            print_main_menu
        end
    end

    def invalid_input
        puts ""
        puts "Did you want to go to main menu?"
        puts ""
    end

    def print_name
        puts "------------------------"
        Team_Avatar.all.each.with_index do |a, i|
            puts ""
            puts "Name #{i}: #{a.name}"
        end
    end
    
    def print_find_by_name(avatar)
        
        tea = Team_Avatar.all.find{|avi| avi.name.downcase == avatar} 
        if !tea 
            puts "Team member not found."
        else       
        puts "name: #{tea.name}" 
        puts ""
        puts "affiliation #{tea.affiliation}"
        puts ""
        puts "enemies #{tea.enemies[0]}"
        end


    end

    def print_enemies 
        Team_Avatar.all.each.with_index do |a, i|
            puts ""
            puts "#{a.name} is #{a.enemies}"
        end
    end

    def print_affiliation
        Team_Avatar.all.each.with_index do |a, i|
            puts ""
            puts "#{a.name} is #{a.affiliation}"
            if "#{a.affiliation}" == ""  
            puts "unknown"
            end
        end        
    end

    def new_options
        API.get_team_avatar
    end

    def bye
        puts ""
        puts "Enjoy a nice cup of hot tea! Farewell!"
        puts ""
        exit
    end
end