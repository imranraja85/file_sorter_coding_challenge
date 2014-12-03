module StudentParser
  class Output
    def self.print(title, records)
      p title
      Array(records).each do |record|
        p "#{record.last_name} #{record.first_name} #{record.campus} #{record.date_of_birth.strftime("%-m/%-d/%Y")} #{record.favorite_color}"
      end
      puts
    end
  end
end

