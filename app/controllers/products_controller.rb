class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new(name: params[:name])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Produit #{@product.name} créé avec succès"
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: "Produit #{@product.name} mis à jour avec succès"
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
