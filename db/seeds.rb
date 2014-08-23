# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


groups = Group.create([{ name: 'Oak Terrace Preserve' }, { name: 'Tanner Plantation'}, { name: 'Wagener Terrace'}, { name: 'Byrnes Down'}, { name: 'Riverland Terrace'}])


groups.each do |group|
  for i in 0..rand(8..14)
    password = "#{Faker::Internet.password(8)}"
    User.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}", password: password, password_confirmation: password, group_id: group.id)
  end
end