def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def letter_selector
  puts "Enter a letter to see students whose name begins with the letter"
  $letter = gets.chomp
end
def print(students) 
  students.each_with_index do |student| 
    puts "#{student[:name]} #{student[:age]} #{student[:location]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
puts "Overall, we have #{names.count} great students" 
end
def input_students 
   # get the first name
  name = gets.chomp
   # while the name is not empty, repeat this code
  while !name.empty? do
    if name.length < 12
     # add the student hash to the array
    students << {name: name, cohort: :november, age: :"27 years old,", location: :London} 
    end
    puts "Now we have #{students.count} students"
     # get another name from the user
    name = gets.chomp
  end
   # return the array of students
  if students.size > 0
    students
  else puts ""
  end
end
students = input_students
print_header 
print(students) 
print_footer(students) 
