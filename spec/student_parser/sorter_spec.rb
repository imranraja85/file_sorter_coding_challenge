require 'student_parser/parsers/base'
require 'student_parser/sorter'

describe StudentParser::Sorter do
  context "When sorting by a single column" do
    before(:all) do 
      OneColumnPersonRecord = Struct.new(:first_name)
      @record1 = OneColumnPersonRecord.new('Rick')
      @record2 = OneColumnPersonRecord.new('Beth')
      @record3 = OneColumnPersonRecord.new('Carl')
    end

    it 'sorts in ascending order' do
      sorter = described_class.new([@record1, @record2, @record3])
      expect(sorter.sort(:first_name)).to eq([@record2, @record3, @record1])
    end

    it 'sorts in descending order' do
      sorter = described_class.new([@record1, @record2, @record3])
      expect(sorter.sort(:first_name, :desc)).to eq([@record1, @record3, @record2])
    end
  end

  context "When sorting by two columns" do
    it 'sorts in ascending order' do
      TwoColumnPersonRecord = Struct.new(:last_name, :gender)
      @record1 = TwoColumnPersonRecord.new('Carl', 'male')
      @record2 = TwoColumnPersonRecord.new('Beth', 'female')
      @record3 = TwoColumnPersonRecord.new('Rick', 'male')
      sorter = described_class.new([@record1, @record2, @record3])

      expect(sorter.sort([:gender,:last_name])).to eq([@record2, @record1, @record3])
    end
  end
end
