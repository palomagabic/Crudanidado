class ProductsController < ApplicationController

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new(product_params)
    @product.category = @category
    if @product.save
      redirect_to category_path(@category)
    end
  end

  def destroy
    if Product.destroy(params[:id])
      redirect_to category_path(params[:category_id])
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
