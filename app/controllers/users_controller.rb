class UsersController < ApplicationController
  def index
	@users = User.all(:order => "last_name ASC")	
	@usersummary = User.all(:limit =>'1')
	@pools = Pool.all
  end
  def edit_individual
    @users = User.order("last_name ASC")
  end

  def update_individual
   User.update(params[:users].keys, params[:users].values)  
   redirect_to users_url, :notice => 'Users Succesfully Updated'   

  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy

    respond_to do |format|
      format.html { redirect_to(users_url, :notice => 'Users Removed') }
      format.xml  { head :ok }
      format.js
    end
  end

end
