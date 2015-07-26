# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Hu Xi",
             email: "williamramthy@hotmail.com",
             password:              "William17NUS!",
             password_confirmation: "William17NUS!",
             admin: true, 
             activated: true,
             activated_at: Time.zone.now)