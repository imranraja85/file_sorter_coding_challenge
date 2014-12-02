module StudentParser
  class Output
    def self.print(title, records)
      p title
      puts 
      records.each do |record|
        p record.join(" ")
      end
      puts 

    end
  end
end

