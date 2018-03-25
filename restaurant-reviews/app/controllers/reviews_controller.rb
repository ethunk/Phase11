class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @rating = Review::RATINGS
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @reviews = @restaurant.reviews.order(created_at: :desc).page(params[:page])
    if @review.save
      flash[:notice] = "Review added successfully!"
      redirect_to restaurant_path(params[:restaurant_id])
    else
      flash[:alert] = @review.errors.full_messages.join(". ")
      redirect_to new_restaurant_review_path(@restaurant)
    end

  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :restaurant_id, :user_id)
  end
end
