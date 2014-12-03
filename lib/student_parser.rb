require "student_parser/version"
require "student_parser/parsers/base"
require "student_parser/parsers/comma"
require "student_parser/parsers/dollar"
require "student_parser/parsers/pipe"
require "student_parser/sorter"
require "student_parser/output"

module StudentParser
  student_records = Parsers::Comma.new('data/comma.txt').extract
  student_records.concat(Parsers::Dollar.new('data/dollar.txt').extract)
  student_records.concat(Parsers::Pipe.new('data/pipe.txt').extract)

  p "*" * 50
  Output.print('ALL RECORDS', student_records)

  p "*" * 50
  puts 
  puts 

  sorted_by_dob = Sorter.call({fields: student_records, column: :date_of_birth, direction: :asc})
  Output.print('Sorted By DOB (ascending)', sorted_by_dob)

  p "*" * 50
  puts 
  puts 

  sorted_by_last_name = Sorter.call({fields: student_records, column: :last_name, direction: :desc})
  Output.print('Sorted By Last Name (descending)', sorted_by_last_name)

  #sorted_by_campus_and_last_name = Sorter.call({fields: student_records, column: [:campus, :last_name], direction: :ascending})
  #Output.print('Sorted By campus and last name', sorted_by_campus_and_last_name)
end
