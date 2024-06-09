seed_files = %w(
  users
  tweets
)

seed_files.each do |seed|
  seed_file = Rails.root.join('db', 'seeds', "#{seed}.rb")
  if File.exist?(seed_file)
    puts "Loading #{seed} seed data..."
    require seed_file
  else
    puts "Seed file #{seed_file} does not exist."
  end
end
