require 'rest-client'
require 'json'
require 'pry'
require 'byebug'

def parse_hash(url)
  long_string = RestClient.get(url)
  JSON.parse(long_string)
end

def character_hash
  parse_hash('http://www.swapi.co/api/people/')["results"]
end

# p character_hash

def character_details(character)
 information = Hash.new
 character_hash.each { |hash| information = hash if hash["name"] == character }
 information
end

# p character_details("Luke Skywalker")

def return_keys(character)
  list = character_details(character).keys

  index = 0
  while index < list.length
    print list[index] + "\n"
    index += 1
  end
end

#p return_keys("Luke Skywalker")

def string_http(url)
  parse_hash(url)["name"]
end

def string_http_films(url)
  parse_hash(url)["title"]
end


def return_value(character, detail)
  if character_details(character)[detail].is_a?(String) && character_details(character)[detail].start_with?("http")
    puts string_http(character_details(character)[detail])
  elsif character_details(character)[detail].is_a?(Array) && character_details(character)[detail][0].start_with?("http") && detail != "films"
    character_details(character)[detail].each do |element|
      puts string_http(element)
    end
  elsif character_details(character)[detail].is_a?(Array) && character_details(character)[detail][0].start_with?("http") && detail == "films"
    character_details(character)[detail].each do |element|
      puts string_http_films(element)
    end
  else puts character_details(character)[detail]
  end
end

# p return_value("Luke Skywalker", "films")

# def get_character_movies_from_api(character)
#   #make the web request
#   all_characters = RestClient.get('http://www.swapi.co/api/people/')
#   character_hash = JSON.parse(all_characters)
#
#   # iterate over the character hash to find the collection of `films` for the given
#   #   `character`
#
#   character_info = {}
#   film_url = []
#   character_hash["results"].each do |array|
#     character_info = array
#     #debugger
#     character_info.each do |key, value|
#       if key == "name" && value.downcase == character
#         film_url = character_info["films"]
#       end
#     end
#   end
#
#   film_info_array = []
#   film_url.each do |url|
#     movie_info = RestClient.get(url)
#     film_info_array << JSON.parse(movie_info)
#   end
#
#   film_info_array
#
#
#   # collect those film API urls, make a web request to each URL to get the info
#   #  for that film
#   # return value of this method should be collection of info about each film.
#   #  i.e. an array of hashes in which each hash reps a given film
#   # this collection will be the argument given to `parse_character_movies`
#   #  and that method will do some nice presentation stuff: puts out a list
#   #  of movies by title. play around with puts out other info about a given film.
# end
#
#
# def parse_character_movies(films_hash)
#   # some iteration magic and puts out the movies in a nice list
#
#
#   array = films_hash.collect.with_index(1) do |movie, index|
#     "#{index}. #{movie["title"]}"
#   end
#
#   index=0
#
#   while index < array.length
#     print array[index] + "\n"
#     index += 1
#   end
# end
#
# #parse_character_movies(get_character_movies_from_api("Luke Skywalker"))
#
# def show_character_movies(character)
#   films_hash = get_character_movies_from_api(character)
#   parse_character_movies(films_hash)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
