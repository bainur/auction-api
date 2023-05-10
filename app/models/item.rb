class Item < ApplicationRecord
  has_many :auctions
  has_many :autobids

  scope :search, lambda { |value|
                   where(' title ILIKE :value OR description ILIKE :value', value: "%#{value}%") if value.present?
                 }
  scope :sort_by_price, lambda { |value|
                          order("items.price #{value}") if value.present? && %w[asc desc].include?(value)
                        }
  def bid_increment
    bid + 1
  end
end
