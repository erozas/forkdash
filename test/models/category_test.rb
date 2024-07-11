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
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
