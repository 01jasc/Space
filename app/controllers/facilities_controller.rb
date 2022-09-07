class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all

    @markers = @facilities.geocoded.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window: render_to_string(partial: "info_window", locals: {facility: facility}),
        image_url: helpers.asset_url("Marker.svg")
      }
    end
  end

  def show
    @facility = Facility.find(params[:id])
    @booking = Booking.new
  end
end
