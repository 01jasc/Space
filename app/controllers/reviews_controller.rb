class ReviewsController < ApplicationController
  before_action :set_facility, :set_user, only: %i[new create]
  def create
    @review = Review.new(review_params)
    @review.facility = @facility
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to facility_path(@facility) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "facilities/show", status: :unprocessable_entity }
        format.json
      end
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
