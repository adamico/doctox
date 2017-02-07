class SearchesController < ApplicationController
  def index
    @query = params[:query]
    @search = Searchkick.search @query, index_name: [Product]
  end
end
