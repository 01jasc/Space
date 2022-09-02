class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show
    @review = Review.new
    @facility = Facility.find(params[:id])
    @booking = Booking.new
  end
end
