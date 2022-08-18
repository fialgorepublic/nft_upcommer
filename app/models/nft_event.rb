class NftEvent < ApplicationRecord
  validates :name, :blockchain, :sale_price, :public_sale_date, presence: true
  validates :name,  uniqueness: { case_sensitive: false }

  belongs_to :plan
  has_one_attached :avatar
end