require 'spec_helper'

describe PryTestcase do
  describe '.enabled?' do
    context 'when default' do
      it 'should not be enabled' do
        is_asserted_by{ not PryTestcase.enabled? }
      end
    end

    context 'with enable' do
      before{PryTestcase.enable}
      after{PryTestcase.disable}

      it 'should be enabled' do
        is_asserted_by{ PryTestcase.enabled? }
      end
    end

    context 'when enable and disable' do
      before{PryTestcase.enable}
      before{PryTestcase.disable}

      it 'should not be enabled' do
        is_asserted_by{ not PryTestcase.enabled? }
      end
    end
  end

  describe '.pry' do
    context 'when enabled' do
      before {PryTestcase.enable}
      it 'should run pry' do
        expect_any_instance_of(Binding).to receive(:pry)
        PryTestcase.pry
      end
    end

    context 'when disabled' do
      before {PryTestcase.disable}
      it 'should run pry' do
        expect_any_instance_of(Binding).not_to receive(:pry)
        PryTestcase.pry
      end
    end
  end

  describe 'pry_once' do
    context 'when enabled' do
      before {PryTestcase.enable}
      it 'should run pry and disabled' do
        expect_any_instance_of(Binding).to receive(:pry)
        PryTestcase.pry_once
        is_asserted_by{ PryTestcase.enabled? == false }
      end
    end

    context 'when disabled' do
      before {PryTestcase.disable}
      it 'should run pry' do
        expect_any_instance_of(Binding).not_to receive(:pry)
        PryTestcase.pry
      end
    end
  end
end
