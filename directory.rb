@students = [] 
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
  puts "3. Save the list to a given file"
  puts "4. Load the list from your chosen file"
  puts "9. Exit" # 9 because we'll be adding more items 
end 
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def process(selection) 
  case selection 
  when "1" 
    puts "Thank you - taking you to student input"
    input_students 
  when "2" 
    puts "Thank you - showing students list..."
    show_students 
  when "9" 
    puts "Goodbye!" 
    exit
  when "3" 
    puts "Saving list" 
    save_students 
  when "4" 
    puts "Loading student list..." 
    load_students 
  else 
    puts "I don't know what you meant, try again" 
  end 
end
def print_students_list 
  @students.each do |student|
    puts "#{student[:name]} #{student[:age]} #{student[:location]} (#{student[:cohort]} cohort)" 
  end 
end
def add_students(name, cohort) 
  @students << {name: name, cohort: cohort.to_sym} 
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
   # while the name is not empty, repeat this code
  while !name.empty? do
     # add the student hash to the array
    puts "Please enter a cohort"
    cohort = STDIN.gets.chomp
    if cohort == "" 
      cohort = "January" 
    end
    add_students(name, cohort) 
    puts "Now we have #{@students.count} students" 
    name = STDIN.gets.chomp 
  end 
end 
def show_students 
  print_header 
  print_student_list
  print_footer 
end
def print_header 
  puts "The students of Villains Academy"
  puts "-------------" 
end
def print_student_list
  @students.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end 
def print_footer 
  puts "Overall, we have #{@students.count} great students" 
end 
def save_students
  puts "What do you want to save the file as?" 
  saved_file = gets.chomp 
  file = File.open(saved_file, "w") do |file| 
  @students.each do |student| 
    student_data = [student[:name], student[:cohort]] 
    csv_line = student_data.join(",") 
    file.puts csv_line 
end 
def load_students(filename = "students.csv") 
  file = File.open(filename, "r") do |file| 
  file.readlines.each do |line| 
  name, cohort = line.chomp.split(',') 
    add_students(name, cohort) 
  end 
end
def try_load_students 
  puts "Enter a filename to load" 
  loaded_file = gets.chomp 
  ARGV != nil ? loaded_file = ARGV.first : filename = "students.csv" 
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename) 
     puts "Loaded #{@students.count} from #{filename}" 
  else 
    puts "Sorry, #{filename} doesn't exist." 
    exit 
  end
end
try_load_students
interactive_menu