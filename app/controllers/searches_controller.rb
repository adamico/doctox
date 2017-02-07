class SearchesController < ApplicationController
  def index
    @query = params[:query]
    @search = Product.search @query
  end
end
