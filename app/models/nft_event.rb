class NftEvent < ApplicationRecord
  validates :name, :blockchain, :sale_price, :public_sale_date, presence: true
  validates :name,  uniqueness: { case_sensitive: false }

  belongs_to :plan, optional: true
  has_one_attached :avatar

  scope :approved, -> { where( approved: true ) }
  scope :all_plan_event, -> { approved.where(plan: Plan.not_free)}
  scope :without_feature_plan, -> {approved.where(plan: Plan.not_featured)}
end
