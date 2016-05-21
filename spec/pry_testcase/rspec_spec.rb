require 'spec_helper'

require_relative '../sample/call_pry'

# TODO: detect starting pry by program
describe PryTestcase::RSpec do
  let(:cat){Cat.new}

  context 'with pry testcase', :with_pry_testcase do
    it 'should start pry' do
      cat.say
    end
  end

  context 'without pry testcase' do
    it 'should not start pry' do
      cat.say
    end
  end

  context 'with pry testcase to it' do
    it 'should start pry', :with_pry_testcase do
      cat.say
    end
  end
end
