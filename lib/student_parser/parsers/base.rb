require 'csv' 
require 'ostruct' 

module StudentParser
  module Parsers
    class PersonRecord < OpenStruct; end

    class Base
      attr_reader :data, :results

      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      def initialize(path)
        @data = ::File.read(path)
        @results = []
      end
      
      def extract
        columns = self.class::COLUMNS

        CSV.parse(data, { :col_sep => self.class::SEPERATOR }) do |row|
          results << PersonRecord.new(
            last_name:      row[columns[:last_name]].strip,
            first_name:     row[columns[:first_name]].strip,
            campus:         format_campus(row[columns[:campus]].strip),
            date_of_birth:  format_date(row[columns[:date_of_birth]].strip),
            favorite_color: row[columns[:favorite_color]].strip
          )
        end

        results
      end
        
      def format_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
