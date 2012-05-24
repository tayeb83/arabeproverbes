# encoding: UTF-8
class ProverbesController < ApplicationController
      before_filter :signed_in_user
      before_filter :correct_user,   :only=> [:destroy,:edit, :update]
   
  # GET /proverbes
  # GET /proverbes.json
  def index
     #@proverbes = Proverbe.all
     @proverbes = Proverbe.paginate(:page=> params[:page])

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
    @proverbe =  current_user.proverbes.build(params[:proverbe])

    if @proverbe.save
      flash[:success] = "تم انشاء المثل"
      redirect_to root_path
    else
       @feed_items = []
      render 'static_pages/home'
    end
  end


  # PUT /proverbes/1
  # PUT /proverbes/1.json
  def update
    @proverbe = Proverbe.find(params[:id])

    respond_to do |format|
      if @proverbe.update_attributes(params[:proverbe])
        format.html { redirect_to @proverbe, :notice => 'تم تحديث المثل' }
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
    @proverbe.destroy
    redirect_back_or root_path
  end

 def liked
    @titre = "المحبون"
    @proverbe = Proverbe.find(params[:id])
    @proverbes = @proverbe.liked.paginate(:page => params[:page])
    render 'show_follow'
  end

  def add_new_comment
    proverbe = Proverbe.find(params[:id])
    proverbe.comments << Proverbe.new(params[:comment])
    redirect_to :action => :show, :id => proverbe
  end

private
   def signed_in_user
      unless signed_in?
        store_location
        redirect_to log_in_path, :notice=> "Please sign in."
      end
    end

 def correct_user
      @proverbe = current_user.proverbes.find_by_id(params[:id])
      redirect_to root_path if @proverbe.nil?
    end

end

