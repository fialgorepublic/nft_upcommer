class Plan < ApplicationRecord
  has_many :nft_events, dependent: :destroy
  has_one_attached :image

  enum plan_type: {
  free: 0,
  home: 1,
  bluechip: 2,
  featured: 3,
  sidebar: 4
  }
end
