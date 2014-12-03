require 'student_parser/parsers/base'
require 'student_parser/parsers/dollar'

describe StudentParser::Parsers::Dollar do
  subject { described_class.new('filepath') }
  let(:data) {"Nolan $ Rhiannon $ O $ LA $ 10-4-1974 $ Vivid Tangerine"}

  context 'when parsing a $ delimited file' do
    it 'has a $ delimiter' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.delimiter).to eq("$")
    end

    it 'correctly reads the date' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.format_date('5-29-1986')).to eq(Date.strptime("5-29-1986", '%m-%d-%Y'))
    end

    it 'extracts the rows into a person record' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      record = subject.extract.first
      expect(record.last_name).to      eq("Nolan")
      expect(record.first_name).to     eq("Rhiannon")
      expect(record.campus).to         eq("Los Angeles")
      expect(record.favorite_color).to eq("Vivid Tangerine")
      expect(record.date_of_birth).to  eq(Date.strptime("10-4-1974", '%m-%d-%Y'))
    end
  end
end

