# frozen_string_literal: true

3.times do |i|
  user = User.find(i + 1)
  15.times do |j|
    Tweet.create!(
      user:,
      content: "#{user.username}の#{j + 1}回目のツイート"
    )
  end

  tweet = Tweet.find((i + 1) * rand(1..15))
  image_path = Rails.root.join('storage/sample.jpeg')
  tweet.image.attach(io: File.open(image_path), filename: 'sample.jpeg')
end
