module StudentParser
  class Output
    def self.print(title, records)
      Array(records).each do |record|
        p "#{record.last_name} #{record.first_name} #{record.campus} #{record.date_of_birth.strftime("%m/%d/%Y")} #{record.favorite_color}"
      end
    end
  end
end

