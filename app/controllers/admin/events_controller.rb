class Admin::EventsController < ApplicationController

before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  before_filter :authenticate_user!
  #load_and_authorize_resource except: [:create]

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		 @event = Event.new(event_params)

	    respond_to do |format|
	      if @event.save
	        @events = Event.all
	        format.html { render action: 'index', notice: 'Event was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @event }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @event.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
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

	def event_params
      params.require(:event).permit(:title, :brief_description, :start_date, :end_date, :time_start, :time_end, :address, :long_description, :image, :website_url, :image_cache)
    end
end
