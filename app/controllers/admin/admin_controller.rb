# frozen_string_literal: true

class Admin::AdminController < ApplicationController
  before_action :user_admin_authenticate

  def user_admin_authenticate
    unless current_user.admin?
      flash[:alert] = 'You are not authorized'
      redirect_to root_path
    end
  end

  def dashboard
  end
end
