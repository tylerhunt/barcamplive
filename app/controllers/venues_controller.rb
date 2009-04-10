class VenuesController < ApplicationController
  before_filter :find_venue, :only => %w(show edit update destroy)

  # GET /venues
  # GET /venues.xml
  def index
    @venues = Venue.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @venues }
      format.json  { render :json => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @venue }
      format.json  { render :json => @venue }
    end
  end

  # GET /venues/new
  # GET /venues/new.xml
  def new
    @venue = Venue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.xml
  def create
    @venue = Venue.new(params[:venue])

    respond_to do |format|
      if @venue.save
        flash[:notice] = 'Venue was successfully created.'
        format.html { redirect_to(@venue) }
        format.xml  { render :xml => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.xml
  def update
    respond_to do |format|
      if @venue.update_attributes(params[:venue])
        flash[:notice] = 'Venue was successfully updated.'
        format.html { redirect_to(@venue) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.xml
  def destroy
    @venue.destroy

    respond_to do |format|
      format.html { redirect_to(venues_url) }
      format.xml  { head :ok }
    end
  end

  def find_venue
    @venue = Venue.find(params[:id])
  end
  protected :find_venue
end
