# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  def display_time
    if created_at > 1.day.ago
      "#{time_ago_in_words(created_at)}前"
    elsif created_at.year == Time.current.year
      created_at.strftime('%-m月%-d日')
    else
      created_at.strftime('%Y年%-m月%-d日')
    end
  end

  def self.followings(current_user)
    following_ids = current_user.followings.pluck(:id)
    Tweet.where(user_id: following_ids).order(created_at: :desc)
  end
end
