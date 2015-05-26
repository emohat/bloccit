class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :flash_attack
 
  #   def flash_attack
  #     flash[:notice] = "You were just flashed."
  #   end


end

