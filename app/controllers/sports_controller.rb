class SportsController < ApplicationController

  def index
    sport_array = Unirest.get("#{ENV['DOMAIN']}/sports.json").body #this is an array of hashes
    @new_sport_array = []
    sport_array.each do |sport|
      @new_sport_array << Sport.new(sport) #converts into object, sport herebis a hash
    end

  end

  def new

  end

  def show
    sport_hash = Unirest.get("#{ENV['DOMAIN']}/sports/#{params[:id]}.json").body
    @sport = Sport.new(sport_hash)
  end

  def create
     @sport = Unirest.post("#{ENV['DOMAIN']}/sports.json", parameters: {name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin]}).body
    redirect_to "/sports/#{@sport['id']}"
  end

  def edit
    @sport = Unirest.get("#{ENV['DOMAIN']}/sports/#{params[:id]}.json").body

  end

  def update
    @sport = Unirest.patch("#{ENV['DOMAIN']}/sports/#{params[:id]}.json", parameters: {name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin]}).body 
    
    redirect_to "/sports/#{@sport["id"]}"
  end

  def destroy
    @sport = Unirest.delete("#{ENV['DOMAIN']}/sports/#{params[:id]}.json").body 
    @sport.destroy
    redirect_to "/sports"
  end
end
