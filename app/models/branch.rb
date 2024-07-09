# == Schema Information
#
# Table name: branches
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  headquarters :boolean
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Branch < ApplicationRecord
  # Belong to a polymorphic address
  has_many :addresses, as: :addressable
  has_many :phone_numbers, as: :phoneable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
end
