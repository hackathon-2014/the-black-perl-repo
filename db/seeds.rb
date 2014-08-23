# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


groups = Group.create([{ name: 'Oak Terrace Preserve', user_id: 2 }, { name: 'Tanner Plantation', user_id: 14}, { name: 'Wagener Terrace', user_id: 1}, { name: 'Byrnes Down', user_id: 22}, { name: 'Riverland Terrace', user_id: 3}])


groups.each do |group|
  for i in 5..rand(8..14)
    password = "#{Faker::Internet.password(8)}"
    User.create(name: "#{Faker::Name.name}", email: "#{Faker::Internet.email}", password: password, password_confirmation: password, group_id: group.id)
  end
end

categories = Category.create([{name: "Power Tools"}, {name: "Hand Tools"}, {name: "Lawncare"}, {name: "Painting"}])

tools = [{ 1 => "Drill"}, { 2 => "Hammer"}, { 3 => "Weed Wacker"}, { 4 => "Roller"}]


groups.each do |group|
  group.users.each do |user|
    for i in 1..rand(1..3)
      pick = rand(0...tools.length)
      tool = tools[pick]
      tool.each do |category, name|
        Tool.create(name: name, user_id: user.id, category_id: category, checked_out?: false)
      end
    end
  end
end
