#!/usr/bin/env ruby

require_relative "api_communicator_factor.rb"
require_relative "command_line_interface_factor.rb"
require "byebug"

welcome
character = get_character_from_user
user_req_detail = what_detail(character)
return_value(character, user_req_detail)
# show_character_movies(character)
