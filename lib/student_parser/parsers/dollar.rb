module StudentParser
  module Parsers
    class Dollar
      include Base

      SEPERATOR = '$'

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :middle_initial => 2,
                 :campus         => 3,
                 :date_of_birth  => 4,
                 :favorite_color => 5}

      def format_date(date)
        Date.strptime(date, '%m-%d-%Y')
      end
    end
  end
end
