# frozen_string_literal: true

require 'optparse'

module OpenDataLoader
  module PDF
    module CLI
      module_function

      def run(argv = ARGV, out: $stdout, err: $stderr)
        options = {}
        parser, help_flag = build_parser(options, out)

        input_paths = parser.parse(argv)
        return 0 if help_flag.call

        if input_paths.empty?
          err.puts('Error: at least one input path is required.')
          err.puts
          err.puts(parser)
          return 1
        end

        OpenDataLoader::PDF.convert(input_paths, **options)
        0
      rescue OptionParser::ParseError => error
        err.puts("Error: #{error.message}")
        err.puts("Use '--help' to see available options.")
        1
      rescue OpenDataLoader::PDF::Error => error
        err.puts(error.message)
        1
      end

      def build_parser(options, out)
        help_requested = false

        parser = OptionParser.new do |opts|
          opts.banner = 'Usage: opendataloader-pdf [options] <input...>'
          opts.separator ''
          opts.separator 'Convert PDFs using the OpenDataLoader CLI.'
          opts.separator ''
          opts.separator 'Options:'

          OpenDataLoader::PDF.register_cli_options(opts, options)

          opts.on('-h', '--help', 'Show this help message') do
            out.puts(opts)
            help_requested = true
          end
        end

        [parser, -> { help_requested }]
      end
    end
  end
end
