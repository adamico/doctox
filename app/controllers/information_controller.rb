class InformationController < ApplicationController
  before_action :load_product

  def new
    @information = @product.information.new
  end

  def create
    @information = @product.information.new(information_params)

    if @information.save
      redirect_to @product, notice: "Information #{@information.name} pour le produit #{@product.name} créée avec succès"
    else
      render 'new'
    end
  end

  def edit
    @information = Information.find(params[:id])
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to @product, notice: "Information #{@information.name} pour le produit #{@product.name} mise à jour avec succès"
    else
      render 'edit'
    end
  end

  private

  def load_product
    @product ||= Product.find(params[:product_id])
  end

  def information_params
    params.require(:information).permit(:name, :contents)
  end
end
