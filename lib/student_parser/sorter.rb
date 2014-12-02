module StudentParser
  class Sorter
    attr_reader :fields, :sort_by, :direction

    COLUMNS = {:last_name      => 0,
               :first_name     => 1,
               :campus         => 2,
               :date_of_birth  => 3,
               :favorite_color => 4}

    def self.call(options)
      new(options).call
    end

    def initialize(options)
      @fields    = options[:fields]
      @sort_by   = options[:column]
      @direction = options[:direction]
    end

    def call
      sort
      reverse if ascending?
      
      fields
    end

    def sort
      if sort_by == :date_of_birth
        fields.sort! { |x,y| format_date(y[COLUMNS[sort_by]]) <=> format_date(x[COLUMNS[sort_by]]) }
      elsif sort_by == [:campus, :last_name]
        fields.sort! { |x,y| y[COLUMNS[:campus], COLUMNS[:last_name]] <=> x[COLUMNS[:campus], COLUMNS[:last_name]]}
        #fields.sort! { |x| x[COLUMNS[:campus], COLUMNS[:last_name]] }
      else
        fields.sort! { |x,y| y[COLUMNS[sort_by]] <=> x[COLUMNS[sort_by]] }
      end
    end

    def reverse
      fields.reverse!  
    end

    def ascending?
      direction == :ascending  
    end

    def format_date(date)
      Date.strptime(date, "%m/%d/%Y")
    end
  end
end
