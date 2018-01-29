# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.create(email: "test@test.gmail.com", password: "password")
Curriculum.create(user_id: 1, name: "test curriculum")
Lesson.create(curriculum_id: 1, description: "awesome lesson", link: "awesome.com")
