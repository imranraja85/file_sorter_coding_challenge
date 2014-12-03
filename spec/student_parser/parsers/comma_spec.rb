require 'student_parser/parsers/base'
require 'student_parser/parsers/comma'

describe StudentParser::Parsers::Comma do
  subject { described_class.new('filepath') }
  let(:data) {"Kirlin, Mckayla, Atlanta, Maroon, 5/29/1986"}

  context 'when parsing a comma delimited file' do
    it 'has a comma delimiter' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.delimiter).to eq(",")
    end

    it 'correctly reads the date' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.format_date('5/29/1986')).to eq(Date.strptime("5/29/1986", '%m/%d/%Y'))
    end

    it 'extracts the rows into a person record' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      record = subject.extract.first
      expect(record.last_name).to      eq("Kirlin")
      expect(record.first_name).to     eq("Mckayla")
      expect(record.campus).to         eq("Atlanta")
      expect(record.favorite_color).to eq("Maroon")
      expect(record.date_of_birth).to  eq(Date.strptime("5/29/1986", '%m/%d/%Y'))
    end
  end
end

