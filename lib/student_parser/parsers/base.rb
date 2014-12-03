require 'csv' 

module StudentParser
  module Parsers
    module Base
      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      PersonRecord = Struct.new(:last_name, :first_name, :campus, 
                                :date_of_birth, :favorite_color)

      attr_reader :data, :student_records

      def initialize(path)
        @data = ::File.read(path)
        @student_records = []
      end

      def columns
        self.class::COLUMNS  
      end

      def delimiter
        self.class::DELIMITER  
      end
      
      def extract
        CSV.parse(data, { :col_sep => delimiter }) {|row| student_records << build_record(row) }
        student_records
      end

      def build_record(row)
        PersonRecord.new(row[columns[:last_name]].strip,
                         row[columns[:first_name]].strip,
                         normalize_campus(row[columns[:campus]].strip),
                         format_date(row[columns[:date_of_birth]].strip),
                         row[columns[:favorite_color]].strip)
      end
        
      def normalize_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
