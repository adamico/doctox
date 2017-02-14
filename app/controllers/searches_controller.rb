class SearchesController < ApplicationController
  def index
    @query = params[:query]
    products = Product.search @query, fields: [:name_tagged], execute: false
    Searchkick.multi_search [products]
    @products = products
  end
end
