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
require "test_helper"

class BranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
