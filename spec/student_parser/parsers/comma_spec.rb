require 'student_parser/parsers/comma'

describe StudentParser::Parsers::Comma do
  subject { described_class.new }

  it 'extracts relevent fields' do
    expect(subject.extract).to eq(parsed_fields)
  end

  def parsed_fields
    [["Kirlin", "Mckayla", "Atlanta", "5/29/1986", "Maroon"], ["Parker", "Matteo", "Melbourne", "2/14/1962", "Burnt Sienna"], ["Cummerata", "Elliot", "New York City", "4/3/1947", "Neon Carrot"]]
  end

end

