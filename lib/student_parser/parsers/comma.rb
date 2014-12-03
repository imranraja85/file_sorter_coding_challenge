require 'csv'
require 'ostruct'

module StudentParser
  module Parsers
    class PersonRecord < OpenStruct
    end
    class Comma
      attr_reader :data, :results

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :campus         => 2,
                 :favorite_color => 3,
                 :date_of_birth  => 4}

      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      def initialize
        @data = ::File.read('data/comma.txt')
        @results = []
      end

      def extract
        CSV.parse(data) do |row|
          results << PersonRecord.new(
            last_name:      row[COLUMNS[:last_name]].strip,
            first_name:     row[COLUMNS[:first_name]].strip,
            campus:         format_campus(row[COLUMNS[:campus]].strip),
            date_of_birth:  format_date(row[COLUMNS[:date_of_birth]].strip),
            favorite_color: row[COLUMNS[:favorite_color]].strip
          )
        end

        results
      end

      def format_date(date)
        Date.strptime(date, '%m/%d/%Y')
      end

      def format_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
