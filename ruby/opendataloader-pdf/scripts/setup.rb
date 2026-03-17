#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
require 'pathname'

package_dir = Pathname.new(__dir__).join('..').expand_path
root_dir = package_dir.join('..', '..').expand_path

jar_glob = root_dir.join('java/opendataloader-pdf-cli/target/opendataloader-pdf-cli-*.jar').to_s
jar_candidates = Dir.glob(jar_glob)

if jar_candidates.empty?
  abort("Could not find the JAR file. Please run 'mvn package' in the 'java/' directory first.")
end

jar_path = jar_candidates.max_by { |path| File.mtime(path) }
if jar_candidates.length > 1
  warn("Found multiple JAR files. Using latest by mtime: #{jar_path}")
end

destination_jar_dir = package_dir.join('jar')
FileUtils.mkdir_p(destination_jar_dir)
FileUtils.cp(jar_path, destination_jar_dir.join('opendataloader-pdf-cli.jar'))

FileUtils.cp(root_dir.join('README.md'), package_dir.join('README.md'))
FileUtils.cp(root_dir.join('LICENSE'), package_dir.join('LICENSE'))
FileUtils.cp(root_dir.join('NOTICE'), package_dir.join('NOTICE'))

third_party_source = root_dir.join('THIRD_PARTY')
third_party_destination = package_dir.join('THIRD_PARTY')
FileUtils.rm_rf(third_party_destination)
FileUtils.cp_r(third_party_source, third_party_destination)

puts 'Ruby package preparation complete.'
