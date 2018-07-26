require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  def find_films(character_hash, character)
    i=0;
    character_hash["results"].each do |character_input|
      if character_input["name"] == character
        return character_hash["results"][i]["films"]
      end
      i+=1
    end
  end

  def get_film_info(arr_of_films)
    arr_of_films.map {|film| RestClient.get(film)}
  end
    def find_films(character_hash, character)
      i = 0
        character_hash["results"].each do |character_input|
          if character_input["name"] == character
            return character_hash["results"][i]["films"]
          end
          i += 1
        end
    end

    def get_film_info(arr_of_films)
      arr_of_films.map do |film|
        RestClient.get(film)
      end
    end

  arr_of_films = find_films(character_hash, character)
  return get_film_info(arr_of_films)
end

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  new_array = []
  films_hash.each do |film|
    new_array.push(JSON.parse(film))
  end
  return new_array
end

def show_character_movies(character)
  i = 0;
  films_hash = get_character_movies_from_api(character)
  array_of_films = parse_character_movies(films_hash)
  array_of_films.each do |film|
    puts array_of_films[i]["title"]
    i+=1
  end
end


def get_appearance_info_from_api(character)
  #find species by iterating through hash, finding species url, then getting species name and returning it
  def get_species(character)
    all_characters = RestClient.get('http://www.swapi.co/api/people/')
    character_hash = JSON.parse(all_characters)
    i=0
    character_hash["results"].each do |character_input|
      if character_input["name"] == character
        return character_hash["results"][i]["species"]
      end
      i += 1
    end
  end
  species_url = get_species(character)
  species_hash = JSON.parse(RestClient.get(species_url[0]))
  species_of_character = species_hash["name"]

  def find_appearance_info(character)
    all_characters = RestClient.get('http://www.swapi.co/api/people/')
    character_hash = JSON.parse(all_characters)
    i=0;
    character_hash["results"].each do |character_input|
      if character_input["name"] == character
        return " who has #{character_hash["results"][i]["hair_color"]} hair, #{character_hash["results"][i]["eye_color"] } eyes, and is #{character_hash["results"][i]["height"]} cm."
      end
      i+=1
    end
  end
  puts "#{character} is a #{species_of_character}," + find_appearance_info(character)
end

## BONUS
#FINDING CHARACTER'S homeworld

def get_character_homeworld_from_api(character) #returning homeworld hash
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  def find_homeworld(character_hash, character) #getting homeworld url
    i = 0
      character_hash["results"].each do |character_input|
          if character_input["name"] == character
            return character_hash["results"][i]["homeworld"]
          end
          i += 1
      end
  end

  def get_homeworld_info(homeworld_info)
      RestClient.get(homeworld_info) #getting the information from the homeworld url
  end
  homeworld_info = find_homeworld(character_hash, character)
  return get_homeworld_info(homeworld_info)
end

def show_name_of_characters_homeworld(homeworld_info) #just the name of the homeworld from the homeworld hash
  homeworld_hash = JSON.parse(homeworld_info)
  return homeworld_hash["name"]
end

def get_homeworld(character)
  homeworld_hash = get_character_homeworld_from_api(character)
  puts show_name_of_characters_homeworld(homeworld_hash)
end

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
