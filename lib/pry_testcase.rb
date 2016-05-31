require "pry_testcase/version"

require 'binding_of_caller'
require 'pry'

module PryTestcase
  @enabled = {}

  class << self
    def enabled?
      !!@enabled[Thread.current]
    end

    def enable
      @enabled[Thread.current] = true
    end

    def disable
      @enabled.delete(Thread.current)
    end

    def pry
      return unless enabled?

      depth = caller_locations.find_index{|c| !c.path.end_with?('pry_testcase.rb')} + 1
      binding.of_caller(depth).pry
    end

    def pry_once
      pry
      disable
    end
  end
end
