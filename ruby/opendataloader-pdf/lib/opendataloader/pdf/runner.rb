# frozen_string_literal: true

require 'open3'

module OpenDataLoader
  module PDF
    module Runner
      module_function

      JAR_NAME = 'opendataloader-pdf-cli.jar'

      def run_jar(args, quiet: false)
        jar_path = File.expand_path("../../../jar/#{JAR_NAME}", __dir__)

        unless File.exist?(jar_path)
          raise JarNotFoundError,
                "JAR file not found at #{jar_path}. Run ruby/opendataloader-pdf/scripts/setup.rb first."
        end

        command = ['java', '-jar', jar_path, *args]

        if quiet
          stdout, stderr, status = Open3.capture3(*command)
          raise CommandFailedError.new(status: status.exitstatus, output: stderr.empty? ? stdout : stderr) unless status.success?

          return stdout
        end

        output = +''
        Open3.popen2e(*command) do |_stdin, stream, wait_thread|
          stream.each do |line|
            $stdout.write(line)
            output << line
          end

          status = wait_thread.value
          raise CommandFailedError.new(status: status.exitstatus, output: output) unless status.success?
        end

        output
      rescue Errno::ENOENT => error
        if error.message.include?('java')
          raise JavaNotFoundError,
                "'java' command not found. Please ensure Java is installed and available on your PATH."
        end

        raise
      end
    end
  end
end
