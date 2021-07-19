def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return (enter) twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.length} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the arry of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end

#call the methods to run the program
students = input_students
print_header
print(students)
print_footer(students)

