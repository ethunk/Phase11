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
    @category_names = []
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user
    if @restaurant.save
      if !(categorization_params[:categorizations][0] == "")
        categorization_params.require(:categorizations).each do |category_id|
          if (category_id.to_i <= Category.last.id) && (category_id.to_i >0)
            Categorization.create(restaurant_id: @restaurant.id, category_id: category_id)
          end
        end
      end
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

def categorization_params
  params.require(:restaurant).permit(categorizations: [])
end
