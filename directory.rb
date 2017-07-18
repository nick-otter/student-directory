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
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
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
  puts "Overall, we have #{names.count} great students".center(60)
end

def input_students
  students = []

  puts "Please enter the name of the student".center(60)
  puts "(to finish at any point, just hit return twice)".center(60)
  name = gets.chomp
  puts "Enter their cohort (please spell perfectly!)".center(60)
  cohort = gets.gsub(/\n/,"").# https://github.com/makersacademy/problem-solving/issues/102#issuecomment-315815931
  puts "Please enter the birthplace of the student".center(60)
  birthplace = gets.chomp
  puts "Please enter the height of the the student".center(60)
  height = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # create separate methods for response conditions? or put all on gets line?
    if cohort == ""
      cohort = "november"
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, birthplace: birthplace, height: height}
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
