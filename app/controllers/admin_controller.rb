class AdminController < ApplicationController
  def index
    admin_id = session[:user_id]
    @admin_name = User.find(admin_id).name
  end

end
