# frozen_string_literal: true

RSpec.describe OpenDataLoader::PDF::ConvertGenerated do
  describe '.build_args' do
    it 'returns an empty array for empty options' do
      expect(described_class.build_args).to eq([])
    end

    it 'handles string options' do
      args = described_class.build_args(output_dir: '/output', password: 'secret', reading_order: 'xycut')
      expect(args).to eq(['--output-dir', '/output', '--password', 'secret', '--reading-order', 'xycut'])
    end

    it 'handles boolean options' do
      args = described_class.build_args(quiet: true, keep_line_breaks: true)
      expect(args).to eq(['--quiet', '--keep-line-breaks'])
    end

    it 'handles list options with string values' do
      args = described_class.build_args(format: 'json,markdown', content_safety_off: 'all')
      expect(args).to eq(['--format', 'json,markdown', '--content-safety-off', 'all'])
    end

    it 'handles list options with array values' do
      args = described_class.build_args(format: %w[json markdown], content_safety_off: ['hidden-text', 'off-page'])
      expect(args).to eq(['--format', 'json,markdown', '--content-safety-off', 'hidden-text,off-page'])
    end

    it 'skips empty list values' do
      args = described_class.build_args(format: [], content_safety_off: [], output_dir: '/output')
      expect(args).to eq(['--output-dir', '/output'])
    end
  end
end
