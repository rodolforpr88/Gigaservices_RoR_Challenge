puts "removing existing users..."
User.destroy_all
puts "users removed successfully..."

puts "creating users..."
CreateUsersJob.perform_now
puts "#{User.count} created successfully..."
