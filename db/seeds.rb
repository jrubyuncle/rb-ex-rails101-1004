# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "in seeds"

u = User.create email: "example@gmail.com", name: "example", password: "12345678", password_confirmation: "12345678"

puts u.name
puts User.count



20.times do |i|
	g = Group.create title: "group-aa-#{i}", description:"desc", user_id: u.id

    30.times do |j|
    	Post.create content: "post-grp#{i}-post#{j}", group_id: g.id, user_id: u.id
    end
end


