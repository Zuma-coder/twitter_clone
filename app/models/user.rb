# frozen_string_literal: true

class User < ApplicationRecord
  has_many :relationships, foreign_key: :following_id, dependent: :destroy, inverse_of: :following
  # そのユーザがフォローしている
  has_many :followings, through: :relationships, source: :followed

  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :followed_id, dependent: :destroy,
                                      inverse_of: :followed
  # そのユーザがフォローされている
  has_many :followers, through: :reverse_of_relationships, source: :following

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
         omniauth_providers: [:github]

  validates :email, presence: true, unless: :from_github?
  validates :email, uniqueness: true, allow_blank: true
  validates :phone_number, presence: true, unless: -> { from_github? }
  validates :birthdate, presence: true, unless: -> { from_github? }
  validates :username, presence: true
  validates :user_id, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |new_user|
      new_user.password = Devise.friendly_token[0, 20]
      new_user.username = auth.info.nickname
      new_user.user_id = SecureRandom.hex(10)
      new_user.provider = auth.provider
      new_user.uid = auth.uid
      new_user.confirmed_at = Time.zone.now
    end

    user.save!(validate: false) if user.new_record?
    user
  end

  def from_github?
    provider == 'github'
  end
end
