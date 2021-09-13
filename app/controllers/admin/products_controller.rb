# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[show edit update destroy]

    def index
      @categories = Category.all
      @brands = Brand.all
      @search = Product.ransack(params[:q])
      @products = @search.result.joins(:category, :brand)
    end

    def show; end

    def new
      @product = Product.new
    end

    def edit; end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to root_path, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to product_path(@product), notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to product_path, notice: 'Product was successfully destroyed.'
    end

    private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :image, :category_id, :brand_id)
    end
  end
end
