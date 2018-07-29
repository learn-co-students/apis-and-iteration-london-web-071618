require 'rest-client'
require 'json'
require 'pry'

def get_parse(url)
  info = RestClient.get(url)
  JSON.parse(info)
end

def get_character_movies_from_api(character)
  #make the web request and put the info in character_hash
  character_hash =  get_parse('http://www.swapi.co/api/people/')

  #create array of urls of films character was in.
  characters_films = character_hash["results"].find{ |each_char| each_char["name"] == character}["films"]

  #return array of hashes that contain info about movies from url.
  characters_films.map { |url| get_parse(url) }
end

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each { |film| film.map {|key, value| puts "#{value}." if key == "title"}}
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
