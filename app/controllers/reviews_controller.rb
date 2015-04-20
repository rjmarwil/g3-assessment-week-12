class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: "Review was successfully created"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:movie_id, :title, :body)
  end

end