# frozen_string_literal: true

5.times do |i|
  User.create!(
    email: "sample#{i}@example.com",
    username: "サンプルユーザ#{i + 1}",
    password: 'password',
    confirmed_at: Time.zone.now,
    user_id: "sample_#{i}",
    phone_number: '000-0000-0000',
    birthdate: Date.new(1900 + i, 1, 1)
  )
end

Relationship.create!(
  following_id: 1,
  followed_id: 2
)
