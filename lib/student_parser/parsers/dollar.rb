require 'csv'

module StudentParser
  module Parsers
    class Dollar
      attr_reader :data

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :middle_initial => 2,
                 :campus         => 3,
                 :date_of_birth  => 4,
                 :favorite_color => 5}

      CITIES = {"LA"  => "Los Angeles",
                "NYC" => "New York City",
                "SF"  => "San Francisco"}

      def initialize
        @data = ::File.read('data/dollar.txt')
      end

      def extract
        results = []

        CSV.parse(data, { :col_sep => ' $ ' }) do |row|
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
