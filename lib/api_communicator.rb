require 'rest-client'
require 'json'
require 'pry'

# def get_from_api(url)
# RestClient.get(url)
# end

# def parse_JSON(JSON)
#    JSON.parse(JSON)
# end

# def get_character_info
#   character_hash = web_request_all_characters
#   array = character_hash.map {|each_char| each_char}
# end

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  #create array with just results from
  results = character_hash["results"]

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  characters_films = results.find{ |each_char| each_char["name"] == character}["films"]

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  movie_info = characters_films.map do |url|
    info = RestClient.get(url)
    JSON.parse(info)
  end

  movie_info
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |film|
    film.map do |key, value|
    if key == "title"
      puts "#{value}."
    end
  end
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

# show_character_movies("Luke Skywalker")
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
