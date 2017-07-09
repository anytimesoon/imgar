# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
	User.create(name: "User#{i + 1}", email: "user#{i + 1}@email.com", password: "password")
end

User.all.each do |user|
	5.times do |i|
		Picture.create(path: "picture#{i + 1}.jpg", user_id: user.id)
	end
end

User.all.each do |user|
	5.times do |i|
		Comment.create(content: "comment #{i + 1}", user_id: user.id, picture_id: i + 1)
	end
end

5.times do |i|
	Tag.create(name: "tag #{i + 1}")
end

