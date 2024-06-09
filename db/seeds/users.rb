5.times do |i|
  User.create!(
    email: "sample#{i}@example.com",
    username: "サンプルユーザ#{i}",
    password: "password",
    confirmed_at: Time.now,
    user_id: "sample_#{i}",
    phone_number: "000-0000-0000",
    birthdate: Date.new(1900+i, 1, 1)
  )
end