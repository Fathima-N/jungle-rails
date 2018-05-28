class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.select {|item| 
    	item.product_id.to_i == params[:id].to_i }
    	#DEBUGGING TO SEE IF REVIEW ID MATCHES PARAMS ID
    	# puts item.product_id
    	# puts params[:id].to_i
    	# puts item.product_id == params[:id].to_i
    @blank_stars


  end

	# def blank_stars
	# 	@reviews = Review.select {|item| 5 - item.review.to_i }
	# end

end
