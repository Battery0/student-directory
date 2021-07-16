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

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each { |student| puts student }
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

#call the methods to run the program
print_header
print(students)
print_footer(students)