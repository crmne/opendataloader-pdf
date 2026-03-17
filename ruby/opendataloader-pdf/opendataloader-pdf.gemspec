# frozen_string_literal: true

require_relative 'lib/opendataloader/pdf/version'

Gem::Specification.new do |spec|
  spec.name = 'opendataloader-pdf'
  spec.version = OpenDataLoader::PDF::VERSION
  spec.authors = ['opendataloader-project']
  spec.email = ['open.dataloader@hancom.com']

  spec.summary = 'Ruby bindings for the opendataloader-pdf Java CLI.'
  spec.description = 'Convert PDFs into structured JSON, Markdown, HTML, text, and annotated PDF using a polished Ruby API over the opendataloader-pdf CLI runtime.'
  spec.homepage = 'https://opendataloader.org'
  spec.license = 'Apache-2.0'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/opendataloader-project/opendataloader-pdf'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/opendataloader-project/opendataloader-pdf/issues'
  spec.metadata['changelog_uri'] = 'https://github.com/opendataloader-project/opendataloader-pdf/blob/main/CHANGELOG.md'

  spec.bindir = 'exe'
  spec.executables = ['opendataloader-pdf']
  spec.require_paths = ['lib']

  spec.files = Dir.glob('lib/**/*') + Dir.glob('jar/**/*.jar') + Dir.glob('THIRD_PARTY/**/*') + [
    'exe/opendataloader-pdf',
    'README.md',
    'LICENSE',
    'NOTICE'
  ].select { |path| File.exist?(path) }
end
