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
  has_one_attached :logo

  belongs_to :business, class_name: "Business", foreign_key: :business_id, inverse_of: :branches
  has_one :address, as: :addressable, inverse_of: :addressable
  has_many :phone_numbers, as: :phoneable
  has_many :seo_metadata, as: :seoable

  accepts_nested_attributes_for :seo_metadata, allow_destroy: true

  delegate :lat, :lng, to: :address

  extend FriendlyId
  friendly_id :name, use: %i[slugged history]

  def self.ransackable_attributes(auth_object = nil)
    %w[name description slug]
  end

  def eligible_addresses
    Address.where.not(addressable: address).map { |address| [address.line_1, address.id] }
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
