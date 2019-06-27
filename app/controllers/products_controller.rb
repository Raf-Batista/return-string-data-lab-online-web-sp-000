class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    #binding.pry
    @product = Product.create(product_params)
    redirect_to products_path
  end

  def show

  end

  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  private

  def product_params
    params.require(:product).permit(:name, :invnetory, :description, :price)
  end
end
