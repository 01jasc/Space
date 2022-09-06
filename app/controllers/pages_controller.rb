class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    
  end

  def dashboard
    # user_name = current_user.first_name
    @my_bookings = current_user.bookings
  end
end
