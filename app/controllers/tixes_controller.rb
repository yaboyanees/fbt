class TixesController < ApplicationController
    load_and_authorize_resource
    respond_to :html, :js
 
 def index
    @tixes = Tix.find_all_by_user_borrow_id(current_user)
    @pools = Pool.all
    @borrowedtixes = Tix.find(:all, :conditions => "user_borrow_id <>" + current_user.id.to_s + " AND user_borrow_id = " + current_user.id.to_s ) 
    @borrowers = User.all(:order =>"last_name ASC")
    @tix = Tix.update(params[:tixes].keys, params[:tixes].values)
 end
  
  def edit
    @tix = Tix.find(params[:id])
  end


  def create
    @tix = Tix.new(params[:tix])
    @tix.save
    respond_with @tix, :location => tixes_url
  end

 
  def update
    @tix = Tix.find(params[:id])

    respond_to do |format|
       @tix.update_attributes(params[:tix])
        format.html { redirect_to(tixes_url) }
        format.xml  { head :ok }
    end
  end


  def destroy
    @tix = Tix.find(params[:id])
    @tix.destroy
    respond_with @tix, :location => tixes_url
  end

  def show # Transfer
  @borrowers = User.all(:order =>"last_name ASC")
    respond_to do |format|
      format.html #{ redirect_to(tixes_url) }
      format.xml  { render :xml => @tixes }
    end
  end



end
