class FacilitiesController < ApplicationController
  def index
    if request.query_parameters.empty?
      @facilities = Facility.all.geocoded
    else
      @facilities = []
      if params["Gym"] == "true"
        Category.find_by(title: "Gym").facilities.each { |el| @facilities << el }
      end
      if params["Bouldering"] == "true"
        Category.find_by(title: "Bouldering").facilities.each { |el| @facilities << el }
      end
      if params["Climbing"] == "true"
        Category.find_by(title: "Climbing").facilities.each { |el| @facilities << el }
      end
      if params["Swimming"] == "true"
        Category.find_by(title: "Swimming").facilities.each { |el| @facilities << el }
      end
      if params["Tennis"] == "true"
        Category.find_by(title: "Tennis").facilities.each { |el| @facilities << el }
      end
      if params["Volleyball"] == "true"
        Category.find_by(title: "Volleyball").facilities.each { |el| @facilities << el }
      end
      if params["MMA"] == "true"
        Category.find_by(title: "MMA").facilities.each { |el| @facilities << el }
      end
      if params["Badminton"] == "true"
        Category.find_by(title: "Badminton").facilities.each { |el| @facilities << el }
      end
      if params["Kayaking"] == "true"
        Category.find_by(title: "Kayaking").facilities.each { |el| @facilities << el }
      end
    end

    @markers = @facilities.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        info_window: render_to_string(partial: "info_window", locals: {facility: facility}),
        image_url: helpers.asset_url("green.svg")
      }
    end
  end

  def show
    @review = Review.new
    @facility = Facility.find(params[:id])
    @booking = Booking.new
    @reviews = Review.where(facility_id: params[:id])
  end
end
