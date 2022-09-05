class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
    if params[:query].present?
      @facilities = Facility.search_by_category(params[:query])
    else
      @facilities = Facility.all
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @booking = Booking.new
  end
end
