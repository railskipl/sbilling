# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Role.create(:name => "admin")
# Role.create(:name => "user")

admin = User.create({:username => 'admin', :email=> 'admin@admin.com', :password => 'admin123!'})
admin.roles = [Role.first]
admin.save

p "Admin created with username: admin, pwd: admin123!"