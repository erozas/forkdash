# == Schema Information
#
# Table name: branches
#
#  id               :bigint           not null, primary key
#  name             :string
#  description      :text
#  headquarters     :boolean
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  meta_title       :string
#  meta_description :string
#
class Branch < ApplicationRecord
  # Belong to a polymorphic address
  has_many :addresses, as: :addressable, inverse_of: :addressable
  has_many :phone_numbers, as: :phoneable
  has_many :seo_metadata, as: :seoable

  accepts_nested_attributes_for :seo_metadata, allow_destroy: true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
