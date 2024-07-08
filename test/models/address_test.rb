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
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
