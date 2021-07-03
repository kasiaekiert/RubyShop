require 'rails_admin/main_controller'

module RailsAdmin

  class MainController < RailsAdmin::ApplicationController
    rescue_from CanCan::AccessDenied do |exception|
      flash[:alert] = 'You are not authorized.'
      redirect_to main_app.root_path
    end
  end
end
