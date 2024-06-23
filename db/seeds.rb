# frozen_string_literal: true

seed_files = %w[
  users
  tweets
]

seed_files.each do |seed|
  seed_file = Rails.root.join('db', 'seeds', "#{seed}.rb")
  if File.exist?(seed_file)
    Rails.logger.debug "Loading #{seed} seed data..."
    require seed_file
  else
    Rails.logger.debug "Seed file #{seed_file} does not exist."
  end
end
