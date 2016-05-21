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
end
