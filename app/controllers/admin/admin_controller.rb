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
    @categories = Category.all
    @brands = Brand.all
    @search = Product.ransack(params[:q])
    @products = @search.result.joins(:category, :brand)
  end

  def edit; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_root_path, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_root_path, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_root_path, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image, :category_id, :brand_id)
  end
end
