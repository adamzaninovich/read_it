require 'spec_helper'

module ReadIt
  describe Post do
    subject(:post) { Post.new({}) }
    let(:json) { File.read 'spec/fixtures/sub_latest.json' }
    let(:response) { double body: json }
    describe '.parse' do
      it 'parses the json response' do
        expect(JSON).to receive(:parse).with(json).and_return({})
        described_class.parse response
      end

      it 'pulls the posts out of the data' do
        posts = described_class.parse(response)
        expect(posts.first).to be_a Post
      end
    end

    describe '#image?' do
      context 'when the url ends in an image extension' do
        before { allow(post).to receive(:url).and_return 'url.png' }
        it { is_expected.to be_image }
      end
      context 'when the url does not end in an image extension' do
        before { allow(post).to receive(:url).and_return 'url.txt' }
        it { is_expected.to_not be_image }
      end
    end

    describe '#image' do
      context 'when the url ends in an image extension' do
        before { allow(post).to receive(:url).and_return 'url.png' }
        it 'has an image' do
          expect(post.image).to_not be_nil
        end
      end
      context 'when the url does not end in an image extension' do
        before { allow(post).to receive(:url).and_return 'url.txt' }
        it 'does not have an image' do
          expect(post.image).to be_nil
        end
      end
    end

    describe '#nsfw?' do
      context 'when the post is marked over_18' do
        before { allow(post).to receive(:over_18).and_return true }
        it { is_expected.to be_nsfw }
      end
      context 'when the post is not marked over_18' do
        before { allow(post).to receive(:over_18).and_return false }
        it { is_expected.to_not be_nsfw }
      end
    end

    describe '#method_missing' do
      it 'access the data hash' do
        post = Post.new 'some_key' => 'some_value'
        expect(post.some_key).to eq 'some_value'
      end
    end

  end
end
