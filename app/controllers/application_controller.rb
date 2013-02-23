class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  def allmessages
    mess = []
    current_user.messages.group(:book_id).each do |m|
      mess << m
    end
    Message.where(recepient_id: current_user.id).group(:book_id).each do |m|
      mess << m
    end
    @allmessages = mess.uniq
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
