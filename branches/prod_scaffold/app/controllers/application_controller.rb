class ApplicationController < ActionController::Base
  # since everything is restricted, we have to whitelist stuff that doesn't
  # need admin authorization
  before_filter :authorize
  
  protect_from_forgery
  
  protected
    # The only users in the database are administrators (not end users) then
    # if we find it in the db the that session belongs to an admin
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in to access this area"
      end
    end
    
  private
    # looks for a cart given the id in a session and if it isn't there then
    # the app creates one
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
