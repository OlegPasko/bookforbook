class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def allmessages
    #mess = []
    #current_user.messages.each do |m|
    #  mess << m
    #end
    #Message.where(recepient_id: current_user.id).each do |m|
    #  mess << m
    #end
    @allmessages = Message.all
  end

  def current_user
    if Rails.env.production?
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    else
      @current_user = User.first
    end
  end
  helper_method :current_user
  helper_method :allmessages
end
