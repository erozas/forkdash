# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  username               :string
#  slug                   :string
#  phone_number           :string
#  phone_number_verified  :boolean          default(FALSE)
#  admin                  :boolean          default(FALSE)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  
  has_many :addresses, as: :addressable

  has_one_attached :avatar, dependent: :destroy
  attr_accessor :remove_avatar
  after_save { avatar.purge if remove_avatar == '1' }

  scope :admins, -> { where(admin: true) }
  scope :non_admins, -> { where(admin: false) }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend FriendlyId
  friendly_id :username, use: [:slugged, :history]

  def self.ransackable_attributes(auth_object = nil)
    %w[email username phone_number]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
