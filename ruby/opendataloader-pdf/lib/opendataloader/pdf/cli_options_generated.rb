# AUTO-GENERATED FROM options.json - DO NOT EDIT DIRECTLY
# Run `npm run generate-options` to regenerate

# frozen_string_literal: true

module OpenDataLoader
  module PDF
    CLI_OPTIONS = [
      {
        name: 'output-dir',
        ruby_name: :output_dir,
        short_name: 'o',
        type: :string,
        required: false,
        default: nil,
        description: 'Directory where output files are written. Default: input file directory'
      },
      {
        name: 'password',
        ruby_name: :password,
        short_name: 'p',
        type: :string,
        required: false,
        default: nil,
        description: 'Password for encrypted PDF files'
      },
      {
        name: 'format',
        ruby_name: :format,
        short_name: 'f',
        type: :string,
        required: false,
        default: nil,
        description: 'Output formats (comma-separated). Values: json, text, html, pdf, markdown, markdown-with-html, markdown-with-images. Default: json'
      },
      {
        name: 'quiet',
        ruby_name: :quiet,
        short_name: 'q',
        type: :boolean,
        required: false,
        default: false,
        description: 'Suppress console logging output'
      },
      {
        name: 'content-safety-off',
        ruby_name: :content_safety_off,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Disable content safety filters. Values: all, hidden-text, off-page, tiny, hidden-ocg'
      },
      {
        name: 'sanitize',
        ruby_name: :sanitize,
        short_name: nil,
        type: :boolean,
        required: false,
        default: false,
        description: 'Enable sensitive data sanitization. Replaces emails, phone numbers, IPs, credit cards, and URLs with placeholders'
      },
      {
        name: 'keep-line-breaks',
        ruby_name: :keep_line_breaks,
        short_name: nil,
        type: :boolean,
        required: false,
        default: false,
        description: 'Preserve original line breaks in extracted text'
      },
      {
        name: 'replace-invalid-chars',
        ruby_name: :replace_invalid_chars,
        short_name: nil,
        type: :string,
        required: false,
        default: ' ',
        description: 'Replacement character for invalid/unrecognized characters. Default: space'
      },
      {
        name: 'use-struct-tree',
        ruby_name: :use_struct_tree,
        short_name: nil,
        type: :boolean,
        required: false,
        default: false,
        description: 'Use PDF structure tree (tagged PDF) for reading order and semantic structure'
      },
      {
        name: 'table-method',
        ruby_name: :table_method,
        short_name: nil,
        type: :string,
        required: false,
        default: 'default',
        description: 'Table detection method. Values: default (border-based), cluster (border + cluster). Default: default'
      },
      {
        name: 'reading-order',
        ruby_name: :reading_order,
        short_name: nil,
        type: :string,
        required: false,
        default: 'xycut',
        description: 'Reading order algorithm. Values: off, xycut. Default: xycut'
      },
      {
        name: 'markdown-page-separator',
        ruby_name: :markdown_page_separator,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Separator between pages in Markdown output. Use %page-number% for page numbers. Default: none'
      },
      {
        name: 'text-page-separator',
        ruby_name: :text_page_separator,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Separator between pages in text output. Use %page-number% for page numbers. Default: none'
      },
      {
        name: 'html-page-separator',
        ruby_name: :html_page_separator,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Separator between pages in HTML output. Use %page-number% for page numbers. Default: none'
      },
      {
        name: 'image-output',
        ruby_name: :image_output,
        short_name: nil,
        type: :string,
        required: false,
        default: 'external',
        description: 'Image output mode. Values: off (no images), embedded (Base64 data URIs), external (file references). Default: external'
      },
      {
        name: 'image-format',
        ruby_name: :image_format,
        short_name: nil,
        type: :string,
        required: false,
        default: 'png',
        description: 'Output format for extracted images. Values: png, jpeg. Default: png'
      },
      {
        name: 'image-dir',
        ruby_name: :image_dir,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Directory for extracted images'
      },
      {
        name: 'pages',
        ruby_name: :pages,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Pages to extract (e.g., "1,3,5-7"). Default: all pages'
      },
      {
        name: 'include-header-footer',
        ruby_name: :include_header_footer,
        short_name: nil,
        type: :boolean,
        required: false,
        default: false,
        description: 'Include page headers and footers in output'
      },
      {
        name: 'hybrid',
        ruby_name: :hybrid,
        short_name: nil,
        type: :string,
        required: false,
        default: 'off',
        description: 'Hybrid backend for AI processing. Values: off (default), docling-fast'
      },
      {
        name: 'hybrid-mode',
        ruby_name: :hybrid_mode,
        short_name: nil,
        type: :string,
        required: false,
        default: 'auto',
        description: 'Hybrid triage mode. Values: auto (default, dynamic triage), full (skip triage, all pages to backend)'
      },
      {
        name: 'hybrid-url',
        ruby_name: :hybrid_url,
        short_name: nil,
        type: :string,
        required: false,
        default: nil,
        description: 'Hybrid backend server URL (overrides default)'
      },
      {
        name: 'hybrid-timeout',
        ruby_name: :hybrid_timeout,
        short_name: nil,
        type: :string,
        required: false,
        default: '30000',
        description: 'Hybrid backend request timeout in milliseconds. Default: 30000'
      },
      {
        name: 'hybrid-fallback',
        ruby_name: :hybrid_fallback,
        short_name: nil,
        type: :boolean,
        required: false,
        default: false,
        description: 'Opt in to Java fallback on hybrid backend error (default: disabled)'
      },
    ].freeze

    def self.register_cli_options(parser, target)
      CLI_OPTIONS.each do |opt|
        flags = []
        flags << "-#{opt[:short_name]}" if opt[:short_name]

        if opt[:type] == :boolean
          flags << "--#{opt[:name]}"
          parser.on(*flags, opt[:description]) do
            target[opt[:ruby_name]] = true
          end
        else
          flags << "--#{opt[:name]} VALUE"
          parser.on(*flags, String, opt[:description]) do |value|
            target[opt[:ruby_name]] = value
          end
        end
      end
    end
  end
end
