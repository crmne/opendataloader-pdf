# frozen_string_literal: true

module OpenDataLoader
  module PDF
    class Error < StandardError; end
    class InvalidInputError < Error; end
    class JavaNotFoundError < Error; end
    class JarNotFoundError < Error; end

    class CommandFailedError < Error
      attr_reader :status, :output

      def initialize(status:, output:)
        @status = status
        @output = output
        super("The opendataloader-pdf CLI exited with code #{status}.\n\n#{output}")
      end
    end
  end
end
