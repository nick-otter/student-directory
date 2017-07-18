
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

def show_students
  print_header
  print_students_list
  print_footer
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
    add_students_to_arr(name, cohort)
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
  menu_choices = ["1. Input the students", "2. Show the students", "3. Save your list", "4. Load a list", "9. Exit"]
  puts menu_choices
end

def process(selection)
  response = ["You picked ","1","2","3","4"]
  case selection
  when "1"
    puts "#{response[0] + response[1]}"
    input_students
  when "2"
    puts "#{response[0] + response[2]}"
    show_students
  when "3"
    puts "#{response[0] + response[3]}"
    save_students_to_file
  when "4"
    puts "#{response[0] + response[4]}"
    load_students_from_file
  when "9" then exit
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

def save_students_to_file
  # open the file for writing
  puts "You are about to save your list, please give it a name (no need to add .csv etc.):"
  file = File.open("#{gets.chomp}", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students_from_file
  puts "Name the file you want to add (please add its extension!):"
  filename = gets.chomp
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students_to_arr(name, cohort)
  # puts @students # to test
  end
  file.close
end

def add_students_to_arr(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students_from_file
  if !!ARGV
    filename = "students.csv"
  else
    filename = ARGV.first
  end

  return if filename.nil? # get out of the method if it isn't given << important!
  if File.exists?(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students_from_file
interactive_menu

# Past methods

# count = 1
# while count <= 11
# students.each_with_index do |student, index|
# puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) #{student[:height]}, #{student[:birthplace]}"
# count = count + 1
