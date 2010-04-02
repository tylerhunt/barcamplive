class TalksController < ApplicationController
  before_filter :find_venue

  # GET /venues/1/talks
  # GET /venues/1/talks.xml
  def index
    @talks = @venue.talks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
      format.json { render :json => @talks }
    end
  end

  def find_venue
    @venue = Venue.find(params[:venue_id])
  end
  protected :find_venue
end
