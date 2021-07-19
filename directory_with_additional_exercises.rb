def interactive_menu
  # Create an empty array for students
  students = []
  
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit program"
    
    selection = gets.chomp
    
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't understand your command, please try again"
    end
  end
end

def input_students()
  puts "Please enter the names of the students"
  puts "To finish, just hit return (enter) twice"
  
  # Create an empty array
  #students = []
  
  # Get the first name
  name = gets.tr("\n", "")
  
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Ex.5 - Added more information about each student to be included in each student hash.
    # Ex.7 - default value added
    puts "Please enter their hobby"
    hobby = gets.tr("\n", "")
    if hobby == ""
      hobby = "not entered"
    end
    
    # Ex.7 - default value added
    puts "Please enter their current occupation"
    occupation = gets.tr("\n", "")
    if occupation == ""
      occupation = "not entered"
    end
    
    # Ex.7 - default value added
    puts "Please enter their nationality"
    nationality = gets.tr("\n", "")
    if nationality == ""
      nationality = "not entered"
    end
    
    # Ex.7 - Ask for student cohort joining month
    puts "Please enter their cohort month"
    cohort = gets.tr("\n", "")
    # Ex.7 - Loop to make sure a cohort is given for a student
    while cohort.empty?
      puts "You didn't include their cohort - Please enter one now."
      cohort = gets.tr("\n", "")
      if !cohort.empty?
        break
      end
    end
    
    # Add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, occupation: occupation, nationality: nationality}
    
    #Ex.9 - alter output based on number of student(s)
    if students.length == 1
      puts "Now we have #{students.length} student"
    else
      puts "Now we have #{students.length} students"
    end
    
    # Get another name from the user
    name = gets.tr("\n", "")
  end
  
  # Return the arry of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts  "-------------".center(50)
end

=begin
def print(students)
  # Ex.1 - Changed each method to each with index to puts a numbered list with students.
  students.each_with_index do |student, index|
    # Ex.2 - Added conditional to only print students with start with one particular letter only. 
    # I accounted for both upcaspe & downcase.
    # Ex.3 - Added extra conditional to only print names shorter than 12 characters long
    if student[:name].start_with?("A", "a") && student[:name].length < 12
      puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


# Ex.4 - re-written the each method that prints students into a while loop
# Ex.6 - Centered puts output to stdout
def print(students)
  count = 0
  while students.length >= 1
    puts "#{count + 1} #{students[count][:name]} (#{students[count][:cohort]} cohort).".center(50)
    puts "Additional information:".center(50)
    puts "Hobby: #{students[count][:hobby]}".center(50)
    puts "Occupation: #{students[count][:occupation]}".center(50)
    puts "Nationality: #{students[count][:nationality]}".center(50)
    puts "\n"
    count += 1
    if count == students.length
      break
    end
  end
end
=end

# Ex.8 - Group and puts students by cohort month
def print(students)
    existing_cohorts = students.map do |student|
      student[:cohort].capitalize!
    end
    
    existing_cohorts.uniq.each do |month|
      puts "#{month} cohort students:"
      students.each do |student|
        if student[:cohort] == month
          puts student[:name]
        end
      end
    end
end

def print_footer(students)
  #Ex.9 - alter output based on number of student(s)
  case students.length
    when 0
      puts "We need students!".center(50)
    when 1
      puts "Overall, we have #{students.length} great student".center(50)
    else
      puts "Overall, we have #{students.length} great students".center(50)
  end
end

#call the methods to run the program
#students = input_students
interactive_menu
print_header
print(students)
print_footer(students)
