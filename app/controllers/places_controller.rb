class PlacesController < ApplicationController

  def index
    @places = Place.all
    @current_user = User.find_by({ "id" => session["user_id"] })
  end

  def show
    @current_user = User.find_by({ "id" => session["user_id"] })
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @current_user["user_id"] })
  end

  def new
    @current_user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @current_user = User.find_by({ "id" => session["user_id"] })
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
