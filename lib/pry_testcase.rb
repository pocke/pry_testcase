require "pry_testcase/version"

require 'binding_of_caller'
require 'pry'

module PryTestcase
  @enabled = {}

  class << self
    def enabled?
      @enabled[Thread.current]
    end

    def pry
      return unless enabled?

      binding.of_caller(1).pry
    end
  end
end
