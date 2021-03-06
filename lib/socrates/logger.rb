require "logger"

module Socrates
  class Logger < ::Logger
    def self.default
      @logger ||= begin
        logger       = new(STDOUT)
        logger.level = Logger::WARN
        logger
      end
    end
  end
end
