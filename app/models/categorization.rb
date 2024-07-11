# == Schema Information
#
# Table name: categorizations
#
#  id                 :bigint           not null, primary key
#  category_id        :bigint           not null
#  categorizable_type :string           not null
#  categorizable_id   :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Categorization < ApplicationRecord
  belongs_to :category
  belongs_to :categorizable, polymorphic: true
end
