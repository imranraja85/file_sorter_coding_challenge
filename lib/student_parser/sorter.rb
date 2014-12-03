module StudentParser
  class Sorter
    attr_reader :fields, :sort_by, :direction

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
      reverse if descending?
      
      fields
    end

    def sort
      if sort_by == [:campus, :last_name]
        fields.sort! { |x,y| y[COLUMNS[:campus], COLUMNS[:last_name]] <=> x[COLUMNS[:campus], COLUMNS[:last_name]]}
      else
        fields.sort! { |x,y| x[sort_by] <=> y[sort_by] }
      end
    end

    def reverse
      fields.reverse!  
    end

    def ascending?
      direction == :asc  
    end

    def descending?
      !ascending? 
    end
  end
end
