class AuctionsController < ApplicationController
  before_action :authenticate_request

  def create
    @item = Item.find(params[:item_id])
    if @item&.auctions&.last&.user_id == current_user.id
      return render json: { message: "You are currently in the highest bidder position." }, status: 400
    end

    auction = Auction.new(auction_params)
    if auction.save
      render json: { message: 'Auction saved successfully' }, status: 200
    else
      render json: { message: auction.errors.full_messages}, status: 400
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:user_id, :item_id, :price, :placed).tap do |w|
      w[:placed] = DateTime.now
      w[:user_id] = current_user.id
      w[:price] = set_price
    end
  end

  def set_price
    @item&.bid_increment
  end
end
