require 'csv'

@students = [] #empty array accesible to all methods

def interactive_menu
  loop do
    try_load_students
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a .csv file"
  puts "4. Load the list of students from a .csv file"
  puts "9. Exit program"
end

def process(selection)
  case selection
    when "1"
      puts "\n"
      puts "You entered 1: Input the students"
      input_students
    when "2"
      puts "\n"
      puts "You entered 2: Show the students"
      puts "\n"
      show_students
    when "3"
      while true do
        puts "\n"
        puts "You entered 3: Save the list of students to a .csv file."
        puts "What is the name of the file you would like to save students to?"
        puts "Please ensure you save it with a .csv file extension"
        save_filename = STDIN.gets.chomp
        if save_filename.include? ".csv"
          save_students(save_filename)
          break
        end
      end
    when "4"
      while true do
        puts "\n"
        puts "You entered 4: Load the list of students from a .csv file"
        puts "Which .csv file would you like to load from?"
        load_filename = STDIN.gets.chomp
        if load_filename.include? ".csv"
          load_students(load_filename)
          break
        end
      end
    when "9"
      puts"\n"
      puts "You entered 9: Exit program"
      exit
    else
      puts "\n"
      puts "I don't understand your command, please try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "\n"
  puts "Please enter the names of the students. To finish, just hit return (enter) twice"
  # Get the first name
  name = STDIN.gets.chomp
  # if name is an empty string - repeat this code
  while !name.empty? do
    # Call methods to add student information
    hobby = add_hobby
    occupation = add_occupation
    nationality = add_nationality
    cohort = add_cohort
    # Add the student information hash to the student array
    add_students_to_array(name, cohort, hobby, occupation, nationality)
    @students.length == 1 ? (puts "\nNow we have #{@students.length} student") : (puts "\nNow we have #{@students.length} students")
    # Get another name from the user
    puts "Please enter another students name or press return to finish adding students."
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts  "-------------".center(50)
end

def print_students_list
  existing_cohorts = @students.map { |student| student[:cohort] }
  existing_cohorts.uniq.each do |month|
    puts "#{month} cohort students:".upcase
    @students.each do |student|
      if student[:cohort] == month
        puts "Name: #{student[:name]}"
        puts "Hobby: #{student[:hobby]}, Occupation: #{student[:occupation]}, Nationality: #{student[:nationality]}"
        puts "\n"
      end
    end
  end
end

def print_footer
  case @students.length
    when 0
      puts "We need students!".center(50)
      puts "\n"
    when 1
      puts "Overall, we have #{@students.length} great student".center(50)
      puts "\n"
    else
      puts "Overall, we have #{@students.length} great students".center(50)
      puts "\n"
  end
end

def save_students(save_filename)
  CSV.open("./#{save_filename}", "wb") do |csv_file|
    @students.each do |student|
      csv_file << [student[:name], student[:cohort], student[:hobby], student[:occupation], student[:nationality]]
    end
  end
end

def load_students(load_filename = "students.csv")
  CSV.foreach("./#{load_filename}") do |row_in_file|
    name, cohort, hobby, occupation, nationality = row_in_file
    add_students_to_array(name, cohort, hobby, occupation, nationality)
  end
  puts "Previous students from #{load_filename} have been loaded."
  puts "\n"
end

def try_load_students
  filename = ARGV.first # First argument from the command line
  return if filename.nil? # Exit method if no argument given to command line
  if File.exist?(filename) # If the file exists
    load_students(filename) # Run load_students method with the argument of the filename given as argument in command line
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist."
    exit #quit program
  end
end

def add_students_to_array(name, cohort, hobby, occupation, nationality)
  @students << {name: name.capitalize, cohort: cohort, hobby: hobby, occupation: occupation, nationality: nationality.capitalize}
end

def add_hobby
  puts "\n"
  puts "Please enter their hobby"
  hobby = STDIN.gets.chomp
  if hobby == ""
    return "not entered"
  end
  hobby
end

def add_occupation
  puts "\n"
  puts "Please enter their current occupation"
  occupation = STDIN.gets.chomp
  if occupation == ""
    return occupation = "not entered"
  end
  occupation
end

def add_nationality
  puts "\n"
  puts "Please enter their nationality"
  nationality = STDIN.gets.chomp
  if nationality == ""
    return "not entered"
  end
  nationality
end

def add_cohort
  puts "\n"
  puts "Please enter their cohort month"
  cohort = STDIN.gets.chomp
  while cohort.empty?
    puts "You didn't include their cohort - Please enter one now."
    cohort = STDIN.gets.chomp
    if !cohort.empty?
      break
    end
  end
  cohort
end

#call interactive menu method to run the program
interactive_menu