# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from Devise::AccessDenied, with: :unauthorized

  def index
    @categories = Category.all
  end

  private

  def unauthorized
    redirect_to root_path, flash: "You are not authorized"
  end
end
