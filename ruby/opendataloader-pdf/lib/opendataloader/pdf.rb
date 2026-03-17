# frozen_string_literal: true

require_relative 'pdf/version'
require_relative 'pdf/error'
require_relative 'pdf/runner'
require_relative 'pdf/cli_options_generated'
require_relative 'pdf/convert_generated'
require_relative 'pdf/cli'

module OpenDataLoader
  module PDF
    class << self
      def convert(input_paths, **options)
        input_list = normalize_input_paths(input_paths)
        validate_input_paths!(input_list)

        normalized_options = symbolize_keys(options)
        args = input_list + ConvertGenerated.build_args(**normalized_options)

        run_jar(args, quiet: normalized_options.fetch(:quiet, false))
      end

      def run_jar(args, quiet: false)
        Runner.run_jar(args, quiet: quiet)
      end

      # @deprecated Use `convert` and keyword options instead.
      def run(
        input_path,
        output_folder: nil,
        password: nil,
        replace_invalid_chars: nil,
        generate_markdown: false,
        generate_html: false,
        generate_annotated_pdf: false,
        keep_line_breaks: false,
        content_safety_off: nil,
        html_in_markdown: false,
        add_image_to_markdown: false,
        no_json: false,
        debug: false,
        use_struct_tree: false
      )
        warn('run() is deprecated and will be removed in a future version. Use convert() instead.')

        formats = []
        formats << 'json' unless no_json

        if generate_markdown
          formats << if add_image_to_markdown
                       'markdown-with-images'
                     elsif html_in_markdown
                       'markdown-with-html'
                     else
                       'markdown'
                     end
        end

        formats << 'html' if generate_html
        formats << 'pdf' if generate_annotated_pdf

        convert(
          input_path,
          output_dir: output_folder,
          password: password,
          replace_invalid_chars: replace_invalid_chars,
          keep_line_breaks: keep_line_breaks,
          content_safety_off: content_safety_off,
          use_struct_tree: use_struct_tree,
          format: formats.empty? ? nil : formats,
          quiet: !debug
        )
      end

      private

      def normalize_input_paths(input_paths)
        if input_paths.is_a?(Array)
          input_paths.map(&:to_s)
        else
          [input_paths.to_s]
        end
      end

      def validate_input_paths!(input_paths)
        raise InvalidInputError, 'At least one input path must be provided.' if input_paths.empty?

        input_paths.each do |path|
          raise InvalidInputError, "Input file or folder not found: #{path}" unless File.exist?(path)
        end
      end

      def symbolize_keys(hash)
        hash.each_with_object({}) do |(key, value), normalized|
          normalized[key.to_sym] = value
        end
      end
    end
  end
end
