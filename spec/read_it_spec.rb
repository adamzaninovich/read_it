require 'spec_helper'

describe ReadIt do
  describe '.sub' do
    it 'makes a new sub' do
      expect(ReadIt::Sub).to receive(:new).with 'subname'
      ReadIt.sub 'subname'
    end
  end
end
