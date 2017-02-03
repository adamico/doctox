class SearchesController < ApplicationController
  def index
    @query = params[:query]
    @search = []
  end
end
