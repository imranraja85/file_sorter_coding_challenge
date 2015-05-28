module StudentParser
  class Sorter
    attr_reader :records

    def initialize(records)
      @records = records
    end

    def sort(column_names, direction = :asc)
      #records.sort_by!{ |x| Array(column_names).collect{|column_name| x.send(column_name)} }
      records.sort_by!{ |x| Array(column_names).collect{|column_name| x[column_name]} }

      records.reverse! if direction != :asc
      records
    end


  end
end
