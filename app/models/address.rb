# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  addressable_type :string           not null
#  addressable_id   :bigint           not null
#  line_1           :string           not null
#  line_2           :string
#  apt_number       :string
#  zip_code         :string
#  city             :string
#  country          :string
#  lat              :decimal(10, 6)   not null
#  lng              :decimal(10, 6)   not null
#  google_place_id  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  default          :boolean          default(FALSE)
#
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :line_1, presence: true
  validates :lat, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  scope :default, -> { where(default: true) }
  scope :not_default, -> { where(default: false) }

  after_create :set_google_place_id

  def lat_lng
    "#{lat},#{lng}"
  end

  private

  def set_google_place_id
    Addresses::SetGooglePlaceIdWorker.perform_async(self.id)
  end
end
