class Plan < ApplicationRecord
  has_many :nft_events, dependent: :destroy
end
