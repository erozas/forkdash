# == Schema Information
#
# Table name: categories
#
#  id           :bigint           not null, primary key
#  ancestry     :string
#  position     :integer          default(1)
#  name         :string           not null
#  description  :text
#  hex_bg_color :string
#  hex_fg_color :string
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Category < ApplicationRecord

  has_one_attached :image do |blob|
    blob.variant :thumb, resize: "100x100"
    blob.variant :medium, resize: "300x300"
    blob.variant :large, resize: "600x600"
  end

  has_many :categorizations
  # has_many :products, through: :categorizations, source: :categorizable, source_type: "Product"

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_ancestry

  def eligible_categories
    Category.where.not(id: id).map { |category| [category.name, category.id] }
  end

  private

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
