module ReadIt
  class Sub
    attr_reader :name

    def initialize name
      @name = "/r/#{name}"
    end

    def recent
      Post.parse ReadIt.http.get "#{name}/new.json"
    end

    def sample
      recent.sample
    end

  end
end
