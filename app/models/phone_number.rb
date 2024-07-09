# == Schema Information
#
# Table name: phone_numbers
#
#  id             :bigint           not null, primary key
#  phoneable_type :string           not null
#  phoneable_id   :bigint           not null
#  area_code      :string           not null
#  number         :string           not null
#  extension      :string
#  default        :boolean          default(FALSE)
#  verified       :boolean          default(FALSE)
#  banned         :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class PhoneNumber < ApplicationRecord
  belongs_to :phoneable, polymorphic: true

  def full_number
    "#{area_code} #{number}"
  end
end
