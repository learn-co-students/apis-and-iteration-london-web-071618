#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def run
  welcome
  def get_result
    loop do
      character = get_character_from_user
      preference = get_preference
      if preference == "films"
        show_character_movies(character)
        elsif preference == "appearance"
          get_appearance_info_from_api(character)
        elsif preference == "homeworld"
          get_homeworld(character)
        elsif preference == "exit"
          break
        else puts "Input not recognised. Try again."
      end
    end
  end
  get_result
end


run
