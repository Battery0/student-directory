# Add all students to an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of The West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

# print names of students from the 'students' array
puts "The students of Villains Academy"
puts "-------------"
students.each { |student| puts student }

# Print the total number of students
puts "Overall, we have #{students.length} great students"