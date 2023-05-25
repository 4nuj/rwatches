class ReviewsController < ApplicationController
  before_action :set_rental, only: [:new, :create]

  def new
    @rental = Rental.find(params[:rental_id])
    @review = @rental.build_review
  end

  def create

    @review = @rental.build_review(review_params)
    if @review.save
      redirect_to user_rentals_path, notice: "Review was successfully created."
    else
      render :new
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:rental_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
