class SportsController < ApplicationController

  def index
    @sports = Unirest.get("http://localhost:3000/api/v1/sports.json").body
  end

  def new

  end

  def show
    @sport = Unirest.get("http://localhost:3000/api/v1/sports/#{params[:id]}.json").body
  end

  def create
     @sport = Unirest.post("http://localhost:3000/api/v1/sports.json", parameters: {name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin]}).body
    redirect_to "/sports/#{@sport['id']}"
  end

  def edit
    @sport = Unirest.get("http://localhost:3000/api/v1/sports/#{params[:id]}.json").body

  end

  def update
    @sport = Unirest.patch("http://localhost:3000/api/v1/sports/#{params[:id]}.json", parameters: {name: params[:name], players: params[:players], country_of_origin: params[:country_of_origin]}).body 
    
    redirect_to "/sports/#{@sport["id"]}"
  end

  def destroy
    @sport = Unirest.delete("http://localhost:3000/api/v1/sports/#{params[:id]}.json").body 
    @sport.destroy
    redirect_to "/sports"
  end
end
