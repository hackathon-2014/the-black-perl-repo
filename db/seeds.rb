# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


groups = Group.create([{ name: 'Oak Terrace Preserve', user_id: 0 }, { name: 'Tanner Plantation', user_id: 0}, { name: 'Wagener Terrace', user_id: 1}, { name: 'Byrnes Down', user_id: 1}, { name: 'Riverland Terrace', user_id: 0}])


groups.each do |group|
  for i in 0..rand(8..14)
    password = "#{Faker::Internet.password(8)}"
    User.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}", password: password, password_confirmation: password, group_id: group.id)
  end
end
