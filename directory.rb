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
  if students.count <= 0
    return
  end

  students.each_with_index do |student, index|
      cohort_of_your_choice = "november".to_sym  # or can just be :november
      if student[:cohort] == cohort_of_your_choice
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(60) # alternative solution: students.map do |i| i[:cohort]
    end
  end
end

def print_footer(names)
  if names.count <= 0
    return
  end

  if names.count == 1
      puts "Overall, we have #{names.count} great student".center(60)
  else
      puts "Overall, we have #{names.count} great students".center(60)
  end
end


def input_students
  students = []

  puts "Please enter the name of the student".center(60)
  puts "(to finish at any point, just hit return twice)".center(60)
    name = gets.gsub(/\n/,"")
  puts "Enter their cohort (please spell perfectly!)".center(60)
    cohort = gets.gsub(/\n/,"") # https://github.com/makersacademy/problem-solving/issues/102#issuecomment-315815931
  puts "Please enter the birthplace of the student".center(60)
    birthplace = gets.gsub(/\n/,"")
  puts "Please enter the height of the the student".center(60)
    height = gets.gsub(/\n/,"")
  # while the name is not empty, repeat this code
  while !name.empty? do
    if cohort == ""
      cohort = "november"
    end
    students << {name: name, cohort: cohort.to_sym, birthplace: birthplace, height: height}
    if students.count == 1
        "Now we have #{students.count} student"
    else
        "Now we have #{students.count} students"
    end
    name = gets.chomp
  end
  students
end


# Past methods

# count = 1
# while count <= 11
# students.each_with_index do |student, index|
# puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:height]}, #{student[:birthplace]}"
# count = count + 1
