require 'csv'

module StudentParser
  module Parsers
    class PersonRecord < Struct.new(:last_name, :first_name, :campus, :date_of_birth, :favorite_color)
    end
    class Comma
      attr_reader :data

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
      end

      def extract
        results = []

        CSV.parse(data) do |row|
          results << [
            row[COLUMNS[:last_name]].strip,
            row[COLUMNS[:first_name]].strip,
            format_campus(row[COLUMNS[:campus]].strip),
            format_date(row[COLUMNS[:date_of_birth]].strip),
            row[COLUMNS[:favorite_color]].strip
          ]
        end

        results
      end

      def format_date(date)
        date
      end

      def format_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
