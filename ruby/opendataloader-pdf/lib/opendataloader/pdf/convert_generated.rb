# AUTO-GENERATED FROM options.json - DO NOT EDIT DIRECTLY
# Run `npm run generate-options` to regenerate

# frozen_string_literal: true

module OpenDataLoader
  module PDF
    module ConvertGenerated
      module_function

      def build_args(
        output_dir: nil,
        password: nil,
        format: nil,
        quiet: false,
        content_safety_off: nil,
        sanitize: false,
        keep_line_breaks: false,
        replace_invalid_chars: nil,
        use_struct_tree: false,
        table_method: nil,
        reading_order: nil,
        markdown_page_separator: nil,
        text_page_separator: nil,
        html_page_separator: nil,
        image_output: nil,
        image_format: nil,
        image_dir: nil,
        pages: nil,
        include_header_footer: false,
        hybrid: nil,
        hybrid_mode: nil,
        hybrid_url: nil,
        hybrid_timeout: nil,
        hybrid_fallback: false
      )
        args = []

        args.concat(['--output-dir', output_dir]) unless output_dir.nil? || output_dir.to_s.empty?
        args.concat(['--password', password]) unless password.nil? || password.to_s.empty?
        unless format.nil?
          if format.is_a?(Array)
            args.concat(['--format', format.join(',')]) unless format.empty?
          else
            args.concat(['--format', format])
          end
        end
        args << '--quiet' if quiet
        unless content_safety_off.nil?
          if content_safety_off.is_a?(Array)
            args.concat(['--content-safety-off', content_safety_off.join(',')]) unless content_safety_off.empty?
          else
            args.concat(['--content-safety-off', content_safety_off])
          end
        end
        args << '--sanitize' if sanitize
        args << '--keep-line-breaks' if keep_line_breaks
        args.concat(['--replace-invalid-chars', replace_invalid_chars]) unless replace_invalid_chars.nil? || replace_invalid_chars.to_s.empty?
        args << '--use-struct-tree' if use_struct_tree
        args.concat(['--table-method', table_method]) unless table_method.nil? || table_method.to_s.empty?
        args.concat(['--reading-order', reading_order]) unless reading_order.nil? || reading_order.to_s.empty?
        args.concat(['--markdown-page-separator', markdown_page_separator]) unless markdown_page_separator.nil? || markdown_page_separator.to_s.empty?
        args.concat(['--text-page-separator', text_page_separator]) unless text_page_separator.nil? || text_page_separator.to_s.empty?
        args.concat(['--html-page-separator', html_page_separator]) unless html_page_separator.nil? || html_page_separator.to_s.empty?
        args.concat(['--image-output', image_output]) unless image_output.nil? || image_output.to_s.empty?
        args.concat(['--image-format', image_format]) unless image_format.nil? || image_format.to_s.empty?
        args.concat(['--image-dir', image_dir]) unless image_dir.nil? || image_dir.to_s.empty?
        args.concat(['--pages', pages]) unless pages.nil? || pages.to_s.empty?
        args << '--include-header-footer' if include_header_footer
        args.concat(['--hybrid', hybrid]) unless hybrid.nil? || hybrid.to_s.empty?
        args.concat(['--hybrid-mode', hybrid_mode]) unless hybrid_mode.nil? || hybrid_mode.to_s.empty?
        args.concat(['--hybrid-url', hybrid_url]) unless hybrid_url.nil? || hybrid_url.to_s.empty?
        args.concat(['--hybrid-timeout', hybrid_timeout]) unless hybrid_timeout.nil? || hybrid_timeout.to_s.empty?
        args << '--hybrid-fallback' if hybrid_fallback

        args
      end
    end
  end
end
