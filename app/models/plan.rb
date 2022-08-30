class Plan < ApplicationRecord
  has_many :nft_events, dependent: :destroy
  has_one_attached :image
end
