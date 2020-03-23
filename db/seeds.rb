teacher1 = Teacher.create!(name: 'Teacher 1', education: :masters)
teacher2 = Teacher.create!(name: 'Teacher 2', education: :masters)
teacher3 = Teacher.create!(name: 'Teacher 3', education: :bachelors)
teacher4 = Teacher.create!(name: 'Teacher 4', education: :bachelors)

student1 = Student.create!(name: 'Student 1', house: :red, roll_number: '100')
student2 = Student.create!(name: 'Student 2', house: :green, roll_number: '101')
student3 = Student.create!(name: 'Student 3', house: :blue, roll_number: '102')
student4 = Student.create!(name: 'Student 4', house: :yellow, roll_number: '103')

subject1 = Subject.create!(name: 'Subject 1', description: 'This is first subject.')
subject2 = Subject.create!(name: 'Subject 2', description: 'This is second subject.')
subject3 = Subject.create!(name: 'Subject 3', description: 'This is third subject.')
subject4 = Subject.create!(name: 'Subject 4', description: 'This is fourth subject.')

teacher1.subjects = [subject1, subject3]
teacher2.subjects = [subject2, subject4]
teacher3.subjects = [subject2, subject3]
teacher4.subjects = [subject1, subject4]

student1.students_courses.create!(subject: subject1, teacher: teacher1)
student2.students_courses.create!(subject: subject2, teacher: teacher2)
student3.students_courses.create!(subject: subject3, teacher: teacher3)
student4.students_courses.create!(subject: subject4, teacher: teacher4)
