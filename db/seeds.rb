require 'faker'

rand(4..10).times do
	password = Faker::Lorem.characters(10)
	u = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: password,
		password_confirmation: password)
	u.save

	rand(5..15).times do
		w = u.wikis.create(
			title: Faker::Lorem.words(rand(1..10)).join(" "), 
			body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
		w.update_attribute(:created_at, Time.now - rand(600..315360000))
	end
end

u = User.new(
	name: 'Cheese',
		email: 'ryanczaja@mac.com',
		password: 'mwklcdrf',
		password_confirmation: 'mwklcdrf')
u.save
u.update_attribute(:role, 'admin')

u = User.new(
	name: 'Cheese8967',
		email: 'cheese8967@gmail.com',
		password: 'mwklcdrf',
		password_confirmation: 'mwklcdrf')
u.save
u.update_attribute(:role, 'member')

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
