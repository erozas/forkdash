# == Schema Information
#
# Table name: seo_metadata
#
#  id           :bigint           not null, primary key
#  seoable_type :string           not null
#  seoable_id   :bigint           not null
#  title        :string
#  description  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class SeoMetadatumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
