class ProverbesController < ApplicationController
  # GET /proverbes
  # GET /proverbes.json
  def index
    @proverbes = Proverbe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @proverbes }
    end
  end

  # GET /proverbes/1
  # GET /proverbes/1.json
  def show
    @proverbe = Proverbe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @proverbe }
    end
  end

  # GET /proverbes/new
  # GET /proverbes/new.json
  def new
    @proverbe = Proverbe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @proverbe }
    end
  end

  # GET /proverbes/1/edit
  def edit
    @proverbe = Proverbe.find(params[:id])
  end

  # POST /proverbes
  # POST /proverbes.json
  def create
    @proverbe = Proverbe.new(params[:proverbe])

    respond_to do |format|
      if @proverbe.save
        format.html { redirect_to @proverbe, :notice => 'Proverbe was successfully created.' }
        format.json { render :json => @proverbe, :status => :created, :location => @proverbe }
      else
        format.html { render :action => "new" }
        format.json { render :json => @proverbe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /proverbes/1
  # PUT /proverbes/1.json
  def update
    @proverbe = Proverbe.find(params[:id])

    respond_to do |format|
      if @proverbe.update_attributes(params[:proverbe])
        format.html { redirect_to @proverbe, :notice => 'Proverbe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @proverbe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /proverbes/1
  # DELETE /proverbes/1.json
  def destroy
    @proverbe = Proverbe.find(params[:id])
    @proverbe.destroy

    respond_to do |format|
      format.html { redirect_to proverbes_url }
      format.json { head :no_content }
    end
  end
end
