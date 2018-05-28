class ReviewsController < ApplicationController
	before_action :require_login, only: [:create]

  def index
  end

  def create
  	
  	@review = Review.new(review_params)
  	@review.user = current_user
  	@review.product_id = params[:product_id]

  	if @review.save
  		redirect_to @review.product
  	else
  		redirect_to @review.product
  	end

  end

  def require_login
  	if current_user
  		true
  	else 
  		flash[:alert] = "You must be logged in to review a product."
  		redirect_to '/login'
  	end
  end


  private 
  def review_params
  	params.require(:review).permit(:description, :rating)
  end


end
