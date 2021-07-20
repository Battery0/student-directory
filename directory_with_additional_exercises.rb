@students = [] #empty array accesible to all methods

def interactive_menu
   loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit program"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't understand your command, please try again"
  end
end

def show_students
    print_header
    print_students_list
    print_footer
end






def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return (enter) twice"

  # Get the first name
  name = gets.chomp
  # if name is an empty string - repeat this code
  while !name.empty? do
    puts "Please enter their hobby"
    hobby = gets.chomp
    if hobby == ""
      hobby = "not entered"
    end
    
    puts "Please enter their current occupation"
    occupation = gets.chomp
    if occupation == ""
      occupation = "not entered"
    end
    
    puts "Please enter their nationality"
    nationality = gets.chomp
    if nationality == ""
      nationality = "not entered"
    end
    
    puts "Please enter their cohort month"
    cohort = gets.chomp

    while cohort.empty?
      puts "You didn't include their cohort - Please enter one now."
      cohort = gets.chomp
      if !cohort.empty?
        break
      end
    end
    
    # Add the student hash to the array
    @students << {name: name, cohort: cohort, hobby: hobby, occupation: occupation, nationality: nationality}
    
    if @students.length == 1
      puts "Now we have #{@students.length} student"
    else
      puts "Now we have #{@students.length} students"
    end
    
    # Get another name from the user
    puts "Please enter another students name or press return to finish adding students."
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts  "-------------".center(50)
end

def print_students_list
    existing_cohorts = @students.map do |student|
      student[:cohort].capitalize!
    end

    existing_cohorts.uniq.each do |month|
      puts "#{month} cohort students:".upcase
      @students.each do |student|
        if student[:cohort] == month
          puts "name: #{student[:name]}"
          puts "hobby: #{student[:hobby]}, occupation: #{student[:occupation]}, nationality #{student[:nationality]}\n\n"
        end
      end
    end
end

def print_footer
  case @students.length
    when 0
      puts "We need students!".center(50)
    when 1
      puts "Overall, we have #{@students.length} great student".center(50)
    else
      puts "Overall, we have #{@students.length} great students".center(50)
  end
end

#call interactive menu to run the program
interactive_menu
