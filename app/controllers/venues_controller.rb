class VenuesController < ApplicationController
  # GET /venues
  # GET /venues.xml
  def index
    time = Time.zone.now

    @talks_by_venue = Talk.all(
      :conditions => { :ends_at => time..(time + 2.hours) }
    ).group_by(&:venue)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
      format.json { render :json => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    @venue = Venue.find(params[:id])

    respond_to do |format|
      format.html { redirect_to venue_talks_path(@venue) }
      format.xml  { render :xml => @venue }
      format.json { render :json => @venues }
    end
  end
end
