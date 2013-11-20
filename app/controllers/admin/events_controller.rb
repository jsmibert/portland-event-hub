class Admin::EventsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(params[:event].permit!)
 		if @event.save
    		redirect_to @event
  		else
    		render 'new'
  		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(params[:event].permit!)
        	redirect_to :action => 'show', :id => @event
      	else
        	render :action => 'edit'
    	end
	end

	def show
		@event = Event.find(params[:id])
	end

	def destroy
		Event.find(params[:id]).destroy
      	redirect_to :action => 'index'
	end
end
