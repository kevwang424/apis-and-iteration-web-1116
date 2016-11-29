require 'rest-client'
require 'json'
require 'pry'
require 'byebug'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`

  character_info = {}
  film_url = []
  character_hash["results"].each do |array|
    character_info = array
    #debugger
    character_info.each do |key, value|
      if key == "name" && value.downcase == character
        film_url = character_info["films"]
      end
    end
  end

  film_info_array = []
  film_url.each do |url|
    movie_info = RestClient.get(url)
    film_info_array << JSON.parse(movie_info)
  end

  film_info_array


  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

#p get_character_movies_from_api("Luke Skywalker")

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list


  array = films_hash.collect.with_index(1) do |movie, index|
    "#{index}. #{movie["title"]}"
  end

  index=0

  while index < array.length
    print array[index] + "\n"
    index += 1
  end
end

#parse_character_movies(get_character_movies_from_api("Luke Skywalker"))

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
