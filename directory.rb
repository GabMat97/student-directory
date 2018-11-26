@students = [] # an empty array accessibly to all methods 
def save_students 
  file = File.open("students.csv", "w") 
  @students.each do |student| 
    student_data = [student[:name], student[:cohort]] 
    csv_line = student_data.join(",") 
    file.puts csv_line 
  end 
  file.close 
end
def load_students(filename = "students.csv") 
  file = File.open(filename, "r") 
  # "r" refers to read only 
  file.readlines.each do |line| 
  name, cohort = line.chomp.split(',') 
    @students << {name: name, cohort: cohort.to_sym} 
  end 
  file.close 
end
def print_menu 
  puts "1. Input the students" 
  puts "2. Show the students" 
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items 
end 
def show_students 
  print_header 
  print_students_list 
  print_footer 
end 
def process(selection) 
  case selection
    when "1" 
      input_students 
    when "2" 
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9" 
      exit 
    else 
      puts "I don't know what you meant, try again" 
  end 
end
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def print_header
  puts "The students of Villains Academy".center(50) 
  puts "-------------".center(50) 
end
def print_students_list 
  @students.each do |student|
    puts "#{student[:name]} #{student[:age]} #{student[:location]} (#{student[:cohort]} cohort)" 
  end 
end
def print_footer 
  puts "Overall, we have #{@students.count} great students" 
end
def input_students
  puts "Please enter the names of the students".center(50) 
  puts "To finish, just hit return twice".center(50) 
  name = STDIN.gets.chomp
  puts "Enter a cohort for the student, to finish, just hit return twice" 
  cohort = STDIN.gets.chomp
  if cohort == "" 
    cohort = "January" 
  end 
   # while the name is not empty, repeat this code
  while !name.empty? do
     # add the student hash to the array
    @students << {name: name, cohort: cohort, age: :"27 years old,", location: :London} 
    if @students.count == 1
      puts "Now we have #{@student.count} student".center(50)
    else 
      puts "Now we have #{@students.count} students".center(50)
    end
  end
     # get another name from the user
    name = STDIN.gets.chomp
    cohort = STDIN.gets.chomp
    if cohort == "" 
      cohort = "January" 
    end 
   # return the array of students
  if @students.size > 0
    @students
  else puts ""
  end
end
def try_load_students 
  filename = ARGV.first
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename) 
     puts "Loaded #{@students.count} from #{filename}" 
  else 
    puts "Sorry, #{filename} doesn't exist." 
    exit 
  end 
end
load_students
interactive_menu