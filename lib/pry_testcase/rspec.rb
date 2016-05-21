require 'pry_testcase'

module PryTestcase
  module RSpec
    ::RSpec.shared_context 'with Pry Testcase', :with_pry_testcase do
      before { PryTestcase.enable }
      after { PryTestcase.disable }
    end
  end
end

RSpec.configure do |config|
  config.extend PryTestcase::RSpec
end
