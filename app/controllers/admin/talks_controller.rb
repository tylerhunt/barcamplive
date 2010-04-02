class Admin::TalksController < Admin::BaseController
  before_filter :find_venue
  before_filter :find_talk, :only => %w(edit update destroy)

  # GET /venues/1/talks
  # GET /venues/1/talks.xml
  def index
    @talks = @venue.talks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
      format.json  { render :json => @talks }
    end
  end

  # GET /venues/1/talks/new
  # GET /venues/1/talks/new.xml
  def new
    @talk = @venue.talks.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  # GET /venues/1/talks/1/edit
  def edit
  end

  # POST /venues/1/talks
  # POST /venues/1/talks.xml
  def create
    @talk = @venue.talks.new(params[:talk])

    respond_to do |format|
      if @talk.save
        flash[:notice] = 'Talk was successfully created.'
        format.html { redirect_to(admin_venue_talks_path(@venue)) }
        format.xml  { render :xml => @talk, :status => :created, :location => @talk }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1/talks/1
  # PUT /venues/1/talks/1.xml
  def update
    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        flash[:notice] = 'Talk was successfully updated.'
        format.html { redirect_to(admin_venue_talks_path(@venue)) }
        format.xml  { head :ok }
      else
        format.html { render :action => 'edit' }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1/talks/1
  # DELETE /venues/1/talks/1.xml
  def destroy
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to(admin_venue_talks_path(@venue)) }
      format.xml  { head :ok }
    end
  end

  def find_venue
    @venue = Venue.find(params[:venue_id])
  end
  protected :find_venue

  def find_talk
    @talk = @venue.talks.find(params[:id])
  end
  protected :find_talk
end
