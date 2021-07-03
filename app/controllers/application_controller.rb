# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def index
    @categories = Category.all
  end

  private

  def unauthorized
    redirect_to root_path, flash: "You are not authorized"
  end
end
