require 'student_parser/parsers/base'

describe StudentParser::Parsers::Base do
  class DummyClass
    COLUMNS = {:last_name  => 0,
               :first_name => 1}
    DELIMITER = ","
  end

  subject {described_class.new}
  let(:klass) do
    klass = DummyClass.new
    klass.extend(StudentParser::Parsers::Base)
  end

  context "when including the parser base" do
    it "gets the columns" do
      expect(klass.columns).to eq({:last_name=>0, :first_name=>1})
    end

    it "gets the delimiter" do
      expect(klass.delimiter).to eq(",")
    end

    it "normalizes a campus name if it is abbreviated" do
      expect(klass.normalize_campus('SF')).to eq("San Francisco")
    end

    it "does not normalize the campus name if it is not abbreviated" do
      expect(klass.normalize_campus('San Francisco')).to eq("San Francisco")
    end
  end
end
