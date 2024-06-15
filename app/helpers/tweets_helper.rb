# frozen_string_literal: true

module TweetsHelper
  def display_time(tweet)
    if tweet.created_at > 1.week.ago
      "#{time_ago_in_words(tweet.created_at)}前"
    elsif tweet.created_at.year == Time.current.year
      tweet.created_at.strftime('%-m月%-d日')
    else
      tweet.created_at.strftime('%Y年%-m月%-d日')
    end
  end
end
