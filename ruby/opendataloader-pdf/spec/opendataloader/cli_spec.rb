# frozen_string_literal: true

require 'stringio'

RSpec.describe OpenDataLoader::PDF::CLI do
  describe '.run' do
    it 'returns 0 and prints help for --help' do
      out = StringIO.new
      err = StringIO.new

      exit_code = described_class.run(['--help'], out: out, err: err)

      expect(exit_code).to eq(0)
      expect(out.string).to include('Usage: opendataloader-pdf [options] <input...>')
      expect(err.string).to eq('')
    end

    it 'returns 1 when input path is missing' do
      out = StringIO.new
      err = StringIO.new

      exit_code = described_class.run([], out: out, err: err)

      expect(exit_code).to eq(1)
      expect(err.string).to include('at least one input path is required')
    end
  end
end
