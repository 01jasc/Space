class ReviewsController < ApplicationController
  before_action :set_facility, :set_user, only: %i[new create]
  def create
    @review = Review.new(review_params)
    @review.facility = @facility
    @review.user = current_user

      if @review.persisted?
        json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: Review.new})
        json.inserted_item render(partial: "restaurants/review", formats: :html, locals: {review: @review})
      else
        json.form render(partial: "reviews/form", formats: :html, locals: {restaurant: @restaurant, review: @review})

    end
  end

  def update
    @review = Review.find(params[:review_id])
    @review.update(review_params)
  end

  def destroy
    @review = Review.find(params[:id])
    return unless @review.user == current_user

    @review.destroy
    redirect_to review_path, status: :see_other
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  def set_user
    @user = current_user
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
