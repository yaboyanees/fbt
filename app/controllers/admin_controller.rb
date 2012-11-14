class AdminController < ApplicationController
protect_from_forgery
  def index
 @usersummary = User.all(:limit =>'1')  
  end
end
