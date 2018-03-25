class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order('created_at DESC').page(params[:page])
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user
    if @restaurant.save
      flash[:notice] = "Restaurant added successfully!"
      redirect_to restaurants_path
    else
      flash.now[:alert] = @restaurant.errors.full_messages.join("\n")
      render :new
    end
  end

end

private

def restaurant_params
  params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
end
