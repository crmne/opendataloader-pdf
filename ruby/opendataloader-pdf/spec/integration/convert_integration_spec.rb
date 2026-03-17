# frozen_string_literal: true

RSpec.describe 'OpenDataLoader::PDF integration' do
  it 'generates output json from a sample PDF' do
    jar_path = File.expand_path('../../jar/opendataloader-pdf-cli.jar', __dir__)
    skip('bundled JAR not found; run ruby/opendataloader-pdf/scripts/setup.rb first') unless File.exist?(jar_path)

    root_dir = File.expand_path('../../../..', __dir__)
    input_pdf = File.join(root_dir, 'samples', 'pdf', '1901.03003.pdf')

    Dir.mktmpdir('opendataloader-ruby-spec') do |output_dir|
      OpenDataLoader::PDF.convert(input_pdf, output_dir: output_dir, format: 'json', quiet: true)

      output_file = File.join(output_dir, '1901.03003.json')
      expect(File.exist?(output_file)).to be(true)
      expect(File.size(output_file)).to be > 0
    end
  end
end
