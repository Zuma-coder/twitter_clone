3.times do |i|
  user = User.find(i+1)
  3.times do |j|
    Tweet.create!(
      user: user,
      content: "#{user.username}の#{j+1}回目のツイート"
    )
  end
end