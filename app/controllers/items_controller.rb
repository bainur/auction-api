class ItemsController < ApplicationController
  before_action :authenticate_request

  def index
    per_page = 10
    @items = Item.search(params[:query])
                 .sort_by_price(params[:sort_price])
                 .includes(:autobids, :auctions)
                 .page(params[:page]).per(per_page)
    @user = current_user
    # render json: {
    #   metadata: { per_page:, items_count: @items.count,
    #               query: params[:query], sort_price: params[:sort_price] },
    #   data: JSON.parse(@items.to_json(include: %i[autobids auctions]))
    # }, status: 200
  end
end
