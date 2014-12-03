require_relative 'lib/student_parser'

student_records = StudentParser::Parsers::Comma.new('data/comma.txt').extract
student_records.concat(StudentParser::Parsers::Dollar.new('data/dollar.txt').extract)
student_records.concat(StudentParser::Parsers::Pipe.new('data/pipe.txt').extract)

results = StudentParser::SortRecords.call({fields: student_records,
                                           sort_by: [:campus, :last_name],
                                           direction: :asc})
StudentParser::Output.print('Output 1:', results)

results = StudentParser::SortRecords.call({fields: student_records,
                                           sort_by: :date_of_birth,
                                           direction: :asc})
StudentParser::Output.print('Output 2:', results)

results = StudentParser::SortRecords.call({fields: student_records, 
                                           sort_by: :last_name, 
                                           direction: :desc})
StudentParser::Output.print('Output 3:', results)
