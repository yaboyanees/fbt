class TixrollupController < ApplicationController

  def index
    @users = User.find(:all, :conditions => "id", :order => "last_name ASC")
    @tixes = Tix.find(:all, :conditions => "user_borrow_id", :order => "guest_l_name ASC, created_at DESC")
    @pools = Pool.find(:all) 
 end
 
 def export
    @users = User.find(:all, :conditions => "id", :order => "last_name ASC")
    @tixes = Tix.find(:all, :conditions => "user_borrow_id", :order => "guest_l_name ASC, created_at DESC")
    @pools = Pool.find(:all)
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="Tix Report.xls"'
    headers['Cache-Control'] = ''
    respond_to do |format|
      format.html { render :layout => false }
    end
 end
end