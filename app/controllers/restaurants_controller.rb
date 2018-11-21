class RestaurantsController < ApplicationController
  # read actions
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    # This is saying to look for all restaurants
    @restaurants = Restaurant.all
  end

  def show
    # This finds a restaurant by id
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # This creates a new instance of a restaurant
    @restaurant = Restaurant.new 
  end

  def create
    # so first this is trying to create a restaurant with the required params, 
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    # edit simply finds the restaurant to edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update 
    # this is running the update functions if the Params fit, then is redirecting to the newly created page otherwise just showing the original page.
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    # this is finding by ID then deleting it then returning to the origin page
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name,:address,:phone_number,:category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end


