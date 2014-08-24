require 'spec_helper'

module ReadIt
  describe Sub do
    let(:json) { File.read 'spec/fixtures/sub_latest.json' }
    let(:response) { double body: json }
    let(:name) { 'subname' }
    subject(:sub) { described_class.new name }
    describe '#initialize' do
      it 'saves the sub name' do
        expect(sub.name).to eq "/r/#{name}"
      end
    end

    describe '#recent' do
      it 'hits the recent endpoint on the reddit API' do
        expect(ReadIt.http).to receive(:get).with("/r/#{name}/new.json").and_return response
        sub.recent
      end
    end

    describe '#recent_images' do
      it 'returns only posts with images' do
        allow(ReadIt.http).to receive(:get).and_return response
        expect(sub.recent_images.all? &:image?).to be_truthy
      end
    end

    describe '#sample' do
      it 'calls sample on recent' do
        recent = []
        allow(sub).to receive(:recent).and_return recent
        expect(recent).to receive(:sample)
        sub.sample
      end
    end
  end
end
