
@students = [] # an empty array accessible to all methods

def print_header
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print_students_list
  if @students.count <= 0
    return
  end
  @students.each_with_index do |student, index|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end

def print_footer
  if @students.count <= 0
    return
  end

  if @students.count == 1
      puts "Overall, we have #{@students.count} great student".center(60)
  else
      puts "Overall, we have #{@students.count} great students".center(60)
  end
end


def input_students

  puts "Please enter the name of the student".center(60)
  puts "(to finish at any point, just hit return twice)".center(60)
    name = STDIN.gets.gsub(/\n/,"")
  puts "Enter their cohort (please spell perfectly!)".center(60)
    cohort = STDIN.gets.gsub(/\n/,"") # https://github.com/makersacademy/problem-solving/issues/102#issuecomment-315815931

  # while the name is not empty, repeat this code
  while !name.empty? do
    if cohort == ""
      cohort = "november"
    end
    add_students(name, cohort)
    if @students.count == 1
        "Now we have #{@students.count} student".center(60)
    else
        "Now we have #{@students.count} students".center(60)
    end
    name = STDIN.gets.chomp
  end
  @students
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
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
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name, cohort)
  # puts @students # to test
  end
  file.close
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first
  return if filename.nil? # get out of the method if it isn't given << important!
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

# Past methods

# count = 1
# while count <= 11
# students.each_with_index do |student, index|
# puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:height]}, #{student[:birthplace]}"
# count = count + 1
