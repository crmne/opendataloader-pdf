# frozen_string_literal: true

require 'optparse'

RSpec.describe OpenDataLoader::PDF do
  describe 'CLI options metadata' do
    it 'contains required fields for each option' do
      required = %i[name ruby_name short_name type required default description]

      OpenDataLoader::PDF::CLI_OPTIONS.each do |option|
        expect(option.keys).to include(*required)
      end
    end

    it 'supports short and long options registration' do
      parser = OptionParser.new
      parsed = {}
      OpenDataLoader::PDF.register_cli_options(parser, parsed)

      parser.parse(%w[-o /output -f json --quiet])

      expect(parsed[:output_dir]).to eq('/output')
      expect(parsed[:format]).to eq('json')
      expect(parsed[:quiet]).to be(true)
    end
  end
end
