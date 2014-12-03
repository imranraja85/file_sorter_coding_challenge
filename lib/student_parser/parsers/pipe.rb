module StudentParser
  module Parsers
    class Pipe < Base
      SEPERATOR = '|'

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :middle_initial => 2,
                 :campus         => 3,
                 :favorite_color => 4,
                 :date_of_birth  => 5}

      def format_date(date)
        Date.strptime(date, '%m-%d-%Y')
      end

    end
  end
end
