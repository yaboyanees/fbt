class PoolsController < ApplicationController

  def index
    @pools = Pool.all
    @usersummary = User.all(:limit =>'1')
	#@pools = Pool.find (:all, :conditions => "domain_id = ?", params[:domain_id]]


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pools }
    end
  end

  # GET /pools/1
  # GET /pools/1.xml
  def show
    @pool = Pool.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pool }
    end
  end

  # GET /pools/new
  # GET /pools/new.xml
  def new
    @pool = Pool.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pool }
    end
  end

  # GET /pools/1/edit
  def edit
    @pool = Pool.find(params[:id])
  end

  # POST /pools
  # POST /pools.xml
  def create
   respond_to do |format|
   @pool = Pool.new(params[:pool])
      if @pool.canmaketickets?
       if @pool.save
	 @pool.maketickets
         format.html { redirect_to(pools_url, :notice => 'Game Was Successfully Created') }
         format.xml  { render :xml => @pools }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @pools.errors, :status => :unprocessable_entity }
       end
			else
				 format.html { render :action => "new" }
      end
     end
    end


  # PUT /pools/1
  # PUT /pools/1.xml
  def update
    @pool = Pool.find(params[:id])

    respond_to do |format|
      if @pool.update_attributes(params[:pool])
        format.html { redirect_to(@pool, :notice => 'Game Was Successfully Updated') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pool.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pools/1
  # DELETE /pools/1.xml
  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy

    respond_to do |format|
      format.html { redirect_to(pools_url, :alert => 'Game Was Destroyed') }
      format.xml  { head :ok }
    end
  end
end
