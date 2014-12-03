require 'csv' 

module StudentParser
  module Parsers
    module Base
      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      PersonRecord = Struct.new(:last_name, :first_name, :campus, 
                                :date_of_birth, :favorite_color)

      attr_reader :data, :student_records, :klass

      def initialize(path)
        @data = ::File.read(path)
        @student_records = []
        @klass = self.class
      end
      
      def extract
        columns = klass::COLUMNS

        CSV.parse(data, { :col_sep => klass::SEPERATOR }) do |row|
          student_records << PersonRecord.new(
            row[columns[:last_name]].strip,
            row[columns[:first_name]].strip,
            normalize_campus(row[columns[:campus]].strip),
            format_date(row[columns[:date_of_birth]].strip),
            row[columns[:favorite_color]].strip
          )
        end

        student_records
      end
        
      def normalize_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
