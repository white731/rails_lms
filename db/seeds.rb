# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #

# # create user
# User.create(first_name:"Landon", last_name:"Whitesides")

# # create course
# Course.create(name:"Programming 101")

# # create enrollment via enrollment
# #user with ID 1 and course with ID must exist
# Enrollment.create(role:"Student", user_id:1, course_id:1)

# # create enrollment via instance of user class

# User.find(1).enrollments.create(role:"Student", course_id:1)

# # create enrollment via instance of course class

# Course.find(1).enrollments.create(role:"Student", user_id:1)


# # how to access enrollments

# Course.find(1).enrollments
# User.find(1).enrollments
# Enrollment.all

# # update Enrollment via enrollment

# # update enrollment via instance of enrollment Class

# # get users enrollments


####### actual seed data ############
require 'faker'

users = []
courses = []
roles = ['Student','TA','Teacher']


30.times do |i|
    users << User.create(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name)
end

3.times do |i|
   courses << Course.create(name:Faker::Educator.course_name)
end

courses.each do |course|
    10.times do 
        # Enrollment.create(role: roles.sample, user_id: users.sample.id, course_id: course.id)
        #or 
        course.enrollments.create(role: roles.sample, user_id: users.sample.id)
    end
end



