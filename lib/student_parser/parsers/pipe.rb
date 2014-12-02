require 'csv'

module StudentParser
  module Parsers
    class Pipe
      attr_reader :data

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :middle_initial => 2,
                 :campus         => 3,
                 :favorite_color => 4,
                 :date_of_birth  => 5}

      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      def initialize
        @data = ::File.read('data/pipe.txt')
      end

      def extract
        results = []

        CSV.parse(data, { :col_sep => ' | ' }) do |row|
          results << [
            row[COLUMNS[:last_name]],
            row[COLUMNS[:first_name]],
            format_campus(row[COLUMNS[:campus]]),
            format_date(row[COLUMNS[:date_of_birth]]),
            row[COLUMNS[:favorite_color]]
          ]
        end

        results
      end

      def format_date(date)
        Date.strptime(date, '%m-%d-%Y').strftime("%m/%d/%Y")
      end

      def format_campus(campus)
        CITIES.fetch(campus, campus)  
      end
    end
  end
end
