require_relative 'lib/student_parser'

student_records = StudentParser::Parsers::Comma.new('data/comma.txt').extract
student_records.concat(StudentParser::Parsers::Dollar.new('data/dollar.txt').extract)
student_records.concat(StudentParser::Parsers::Pipe.new('data/pipe.txt').extract)

student_records_sorter = StudentParser::Sorter.new(student_records)

StudentParser::Output.print('Output 1:', student_records_sorter.sort([:campus, :last_name]))
StudentParser::Output.print('Output 2:', student_records_sorter.sort(:date_of_birth))
StudentParser::Output.print('Output 3:', student_records_sorter.sort(:last_name, :desc))
