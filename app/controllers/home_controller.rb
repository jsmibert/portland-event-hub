class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @events = Event.all.order("date_created desc")
    @categories = Category.all.order(:name)
  end
end