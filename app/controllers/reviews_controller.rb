class ReviewsController < ApplicationController
  
  def new
    # we need @restaurant in our `simple_form_for` 
    # when making a new review, the code is linked to a restaurant hence line 7
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # step one, allow params from form
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    restaurant =  Restaurant.find(params[:restaurant_id])
    # assign restaurant to link it with the review
    @review.restaurant = restaurant
    @review.save
    redirect_to restaurant_path(restaurant) # show the page with the new review
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

