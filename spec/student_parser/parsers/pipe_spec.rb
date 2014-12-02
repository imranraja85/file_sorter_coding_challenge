require 'student_parser/parsers/pipe'

describe StudentParser::Parsers::Pipe do
  subject { described_class.new }

  it 'extracts relevent fields' do
    expect(subject.extract).to eq(parsed_fields)
  end

  def parsed_fields
    [["Goyette", "Timmothy", "London", "10/02/1964", "Pacific Blue"], ["Bednar", "Filomena", "New York City", "01/24/1980", "Salmon"], ["Barrows", "Anika", "Hong Kong", "05/05/1965", "Spring Green"]]
  end
end

