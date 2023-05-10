class Autobid < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :item, uniqueness: { scope: [:user] }
  validates :alert, presence: true
end
