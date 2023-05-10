json.metadata do
  json.per_page 10
  json.page @items.current_page
  json.items_count @items.total_count
  json.query params[:query]
  json.sort_price params[:sort_price] 
end

json.data @items do |item|
  json.id item.id
  json.title item.title
  json.description item.description
  json.price item.price
  json.bid item.bid
  json.start_time item.start_time
  json.end_time item.end_time
  auction = item.auctions.last
  if auction
    json.auction do
      json.auction_id auction.id
      json.price auction.price
      json.placed auction.placed
    end
  end
  autobid = item.autobids.where(user_id: @user).last
  if autobid
    json.autobid do
      json.autobid_id autobid.id
      json.alert autobid.alert
    end
  else
    json.autobid nil
  end
end
