require 'httparty'
class Recipe

    include HTTParty

         @@key_value = ENV["FOOD2FORK_KEY"]
         hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.ca'
         base_uri "http://#{hostport}/api"
         format :json

         def self.for term
            get("/recipe/search/", query: {query: term}, headers: { 'Authorization': @@key_value})['results']
        end
end
