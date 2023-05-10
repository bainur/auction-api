class Auction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validate :end_time_cannot_be_in_the_past
  after_create :update_bid

  private

  def end_time_cannot_be_in_the_past
    if self.item.end_time.present? && self.item.end_time < Time.now
      errors.add(:end_time, "can't be in the past")
    end
  end

  def update_bid
    item.update(bid: price)
  end
end
