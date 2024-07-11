class Business < ApplicationRecord
  has_many :branches, class_name: "Branch", foreign_key: :branch_id, inverse_of: :business

  extend FriendlyId
  friendly_id :name, use: %i[slugged history]

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
