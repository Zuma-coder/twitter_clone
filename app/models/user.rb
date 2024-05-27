# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable

  validates :phone_number, presence: true
  validates :birthdate, presence: true
  validates :username, presence: true
  validates :user_id, presence: true, uniqueness: true
end
