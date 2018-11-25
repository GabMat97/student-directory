def print_header
  puts "The students of Villains Academy".center(50) 
  puts "-------------".center(50) 
end
def print(students) 
  students.each_with_index do |student, i| 
    puts "#{i+1}. #{student[:name]} #{student[:age]} #{student[:location]} (#{student[:cohort]} cohort)" 
  end 
end
def print_footer(names)
puts "Overall, we have #{names.count} great students".center(50) 
end
def input_students
  puts "Please enter the names of the students".center(50) 
  puts "To finish, just hit return twice".center(50) 
  students = []
  # get the first name
  name = gets.chomp
  puts "Enter a cohort for the student, to finish, just hit return twice" 
  cohort = gets.chomp
  if cohort == "" 
    cohort = "January" 
  end 
   # while the name is not empty, repeat this code
  while !name.empty? do
     # add the student hash to the array
    students << {name: name, cohort: cohort, age: :"27 years old,", location: :London} 
    if students.count == 1
      puts "Now we have #{student.count} student".center(50)
    else 
    puts "Now we have #{students.count} students".center(50)
    end
  end
     # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
    if cohort == "" 
      cohort = "January" 
    end 
   # return the array of students
  if students.size > 0
    students
  else puts ""
  end
end
students = input_students
if students.nil? || students.empty? 
  puts "We currently have no students!" 
else
end
print_header 
print(students) 
print_footer(students) 
