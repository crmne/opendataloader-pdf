# frozen_string_literal: true

RSpec.describe OpenDataLoader::PDF do
  describe '.convert' do
    it 'raises when no input paths are provided' do
      expect { described_class.convert([]) }.to raise_error(OpenDataLoader::PDF::InvalidInputError, /At least one input path/)
    end

    it 'raises when an input path does not exist' do
      expect { described_class.convert('/tmp/does-not-exist.pdf') }.to raise_error(OpenDataLoader::PDF::InvalidInputError, /Input file or folder not found/)
    end

    it 'runs the jar with normalized args and returns output' do
      input = File.expand_path('../../../../samples/pdf/1901.03003.pdf', __dir__)
      expect(described_class).to receive(:run_jar)
        .with([input, '--format', 'json', '--quiet'], quiet: true)
        .and_return('ok')

      output = described_class.convert(input, format: 'json', quiet: true)
      expect(output).to eq('ok')
    end
  end
end
