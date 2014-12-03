require 'csv' 

module StudentParser
  module Parsers
    module Base
      attr_reader :data, :results

      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      PersonRecord = Struct.new(:last_name, :first_name, :campus, 
                                :date_of_birth, :favorite_color)
      def initialize(path)
        @data = ::File.read(path)
        @results = []
      end
      
      def extract
        columns = self.class::COLUMNS

        CSV.parse(data, { :col_sep => self.class::SEPERATOR }) do |row|
          results << PersonRecord.new(
            row[columns[:last_name]].strip,
            row[columns[:first_name]].strip,
            normalize_campus(row[columns[:campus]].strip),
            format_date(row[columns[:date_of_birth]].strip),
            row[columns[:favorite_color]].strip
          )
        end

        results
      end
        
      def normalize_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
