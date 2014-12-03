module StudentParser
  module Parsers
    class Comma 
      include Base

      DELIMITER = ','

      COLUMNS = {:last_name      => 0,
                 :first_name     => 1,
                 :campus         => 2,
                 :favorite_color => 3,
                 :date_of_birth  => 4}

      def format_date(date)
        Date.strptime(date, '%m/%d/%Y')
      end
    end
  end
end
