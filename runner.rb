require_relative 'lib/student_parser'

student_records = StudentParser::Parsers::Comma.new('data/comma.txt').extract
student_records.concat(StudentParser::Parsers::Dollar.new('data/dollar.txt').extract)
student_records.concat(StudentParser::Parsers::Pipe.new('data/pipe.txt').extract)

sorted_by_campus_and_last_name = StudentParser::Sorter.call({fields: student_records, column: [:campus, :last_name], direction: :asc})
StudentParser::Output.print('Output 1: (Sorted By campus and last name)', sorted_by_campus_and_last_name)

sorted_by_dob = StudentParser::Sorter.call({fields: student_records, column: :date_of_birth, direction: :asc})
StudentParser::Output.print('Output 2: Sorted By DOB (ascending)', sorted_by_dob)

sorted_by_last_name = StudentParser::Sorter.call({fields: student_records, column: :last_name, direction: :desc})
StudentParser::Output.print('Output 3: Sorted By Last Name (descending)', sorted_by_last_name)
