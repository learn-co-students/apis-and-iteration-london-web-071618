require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  a = character_hash['results'].select  { |data|
  data['name'] == character}
  #binding.pry
  a.map { |x| x['films']}

end

#get_character_movies_from_api("Luke Skywalker")
#get_character_data("character")

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
    #array = []
    films_hash[0].map do |url|
      movie = RestClient.get(url)
      movie_hash = JSON.parse(movie)
      print "#{movie_hash['title']}, "
    end

end

#get_character_movies_from_api("Luke Skywalker")
#parse_character_movies(films_hash)


def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

show_character_movies("C-3PO")

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
