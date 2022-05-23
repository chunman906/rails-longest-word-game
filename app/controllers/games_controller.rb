require "json"
require "open-uri"
class GamesController < ApplicationController

  def new
    @letters = []
      10.times {
        @letters << ('a'..'z').to_a.sample
      }
  end

  def valid
    if score(params[:words]) == true
      @reply = "Good to go"
    else
      @reply = "Sorry can't build out of #{@letters[0]}"
    end
   end

  def score(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    solution = URI.open(url).read
    information = JSON.parse(solution)
    information[:found]
  end

end
