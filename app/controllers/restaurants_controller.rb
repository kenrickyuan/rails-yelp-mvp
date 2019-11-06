class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # raise
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save!
    redirect_to restaurants_path
  end

  def show
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id].to_i)
  end
end
