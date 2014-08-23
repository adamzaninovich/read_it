module ReadIt
  class Post
    def self.parse response
      response = JSON.parse response.body
      posts = response.fetch("data", {}).fetch "children", []
      posts.map { |post| new post["data"] }
    end

    def initialize data
      @data = data
    end

    def image?
      image_types.include? url.split('.').last.downcase
    end

    def image
      url if image?
    end

    def nsfw?
      over_18
    end

    def method_missing name, *args, &block
      @data[name.to_s]
    end

    private

    def image_types
      %w(png jpg jpeg gif)
    end
  end
end
