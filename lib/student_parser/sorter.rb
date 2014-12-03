module StudentParser
  class Sorter
    attr_reader :fields, :sort_by, :direction

    def self.call(options)
      new(options).call
    end

    def initialize(options)
      @fields    = options[:fields]
      @sort_by   = options[:sort_by]
      @direction = options[:direction]
    end

    def call
      sort
      reverse if descending?
      
      fields
    end

    def sort
      fields.sort_by!{ |x| Array(sort_by).collect{|s| x[s]}}
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
