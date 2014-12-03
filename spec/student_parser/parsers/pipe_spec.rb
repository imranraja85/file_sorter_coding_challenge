require 'student_parser/parsers/base'
require 'student_parser/parsers/pipe'

describe StudentParser::Parsers::Pipe do
  subject { described_class.new('filepath') }
  let(:data) {"Goyette | Timmothy | E | London | Pacific Blue | 10-2-1964"}

  context 'when parsing a | delimited file' do
    it 'has a | delimiter' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.delimiter).to eq("|")
    end

    it 'correctly reads the date' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      expect(subject.format_date('5-29-1986')).to eq(Date.strptime("5-29-1986", '%m-%d-%Y'))
    end

    it 'extracts the rows into a person record' do
      allow(File).to receive(:read).with('filepath').and_return(data)
      record = subject.extract.first
      expect(record.last_name).to      eq("Goyette")
      expect(record.first_name).to     eq("Timmothy")
      expect(record.campus).to         eq("London")
      expect(record.favorite_color).to eq("Pacific Blue")
      expect(record.date_of_birth).to  eq(Date.strptime("10-2-1964", '%m-%d-%Y'))
    end
  end
end

