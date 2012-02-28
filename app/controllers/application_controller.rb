class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :create_body_id
  def create_body_id
      @body_id = "#{params[:action]}"
  end
end
