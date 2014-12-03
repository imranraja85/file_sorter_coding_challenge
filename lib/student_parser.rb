require "student_parser/version"
require "student_parser/parsers/comma"
require "student_parser/parsers/dollar"
require "student_parser/parsers/pipe"
require "student_parser/sorter"
require "student_parser/output"

module StudentParser
  student_records = Parsers::Comma.new.extract
  #student_records.concat(Parsers::Dollar.new.extract)
  #student_records.concat(Parsers::Pipe.new.extract)

  p "*" * 50
  p student_records
  Output.print('ALL RECORDS', student_records)

  p "*" * 50
  puts 
  puts 

  sorted_by_last_name = Sorter.call({fields: student_records, column: :last_name})
  Output.print('Sorted By Last Name (descending)', sorted_by_last_name)

  p "*" * 50
  puts 
  puts 

  sorted_by_dob = Sorter.call({fields: student_records, column: :date_of_birth, direction: :desc})
  Output.print('Sorted By DOB (ascending)', sorted_by_dob)

  #sorted_by_campus_and_last_name = Sorter.call({fields: student_records, column: [:campus, :last_name], direction: :ascending})
  #Output.print('Sorted By campus and last name', sorted_by_campus_and_last_name)
end
