# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Seed data for Classroom
student_ids = [3, 4, 5]
teacher_ids = [1, 2]

# Create classrooms and associate them with teachers and students
Classroom.create(teacher_id: teacher_ids[0])
Classroom.create(teacher_id: teacher_ids[1])

classrooms = Classroom.all

classrooms[0].students << User.find(student_ids[0])
classrooms[0].students << User.find(student_ids[2])
classrooms[1].students << User.find(student_ids[1])

# Seed data for Timetable
timetable1 = TimeTable.create(title: 'Math Class', description: 'Math class description', schedule: Time.now, teacher_id: 1)
timetable2 = TimeTable.create(title: 'Science Class', description: 'Science class description', schedule: Time.now, teacher_id: 1)


