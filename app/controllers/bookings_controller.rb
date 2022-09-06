class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_facility, only: %i[create]

  def index
    @bookings = Booking.all
  end

  # def new
  #   @facility = Facility.find(params[:facility_id])
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @facility = Facility.find(params[:facility_id])
    @booking.facility = @facility
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "facilities/show", status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)

    redirect_to bookings_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    return unless @booking.user == current_user

    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  def booking_params
    params.require(:booking).permit(:comment, :start_time, :end_time, :checked_in)
  end
end
