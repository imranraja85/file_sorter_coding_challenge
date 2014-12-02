require 'student_parser/parsers/dollar'

describe StudentParser::Parsers::Dollar do
  subject { described_class.new }

  it 'extracts relevent fields' do
    expect(subject.extract).to eq(parsed_fields)
  end

  def parsed_fields
    [["Nolan", "Rhiannon", "Los Angeles", "10/04/1974", "Vivid Tangerine"], ["Wilkinson", "Stacy", "New York City", "01/22/1964", "Shocking Pink"], ["Bruen", "Rigoberto", "San Francisco", "12/01/1962", "Raw Umber"]]
  end
end

