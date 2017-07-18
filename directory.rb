student_count = 11
# let's put all students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    count = 1
    while count <= 11
      students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:height]}, #{student[:birthplace]}"
      count = count + 1
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish at any point, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the birthplace of the student"
  # get the birthplace
  birthplace = gets.chomp
  puts "Please enter the height of the the student"
  # get the height
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, birthplace: birthplace, height: height}
    #puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end



#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
