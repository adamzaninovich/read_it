# ReadIt

A very simple, read-only wrapper for the reddit api

## Installation

Add this line to your application's Gemfile:

    gem 'read_it'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install read_it

## Usage

```ruby
gifs = ReadIt::Sub.new 'gifs'   # => #<ReadIt::Sub:0x007f837c168530 @name="/r/gifs">
random_post = gifs.sample       # => #<ReadIt::Post:0x007f837c08b770...>
random_post.title               # => "It was the best gif I'd seen all day"
random_post.image?              # => true
random_post.nsfw?               # => false
random_post.url                 # => "http://i.imgur.com/D4LcGLt.gif"
```

```ruby
ReadIt.sub('babyelephantgifs').recent.first.url # => "http://i.imgur.com/fogh8W4.gif"
```

```ruby
ReadIt.sub('avocadosgonewild').sample.nsfw? # => true
```

Returns recent posts from the sub reddit that have images

```ruby
ReadIt.sub('formula1').recent_images 
```

## Contributing

1. Fork it ( http://github.com/adamzaninovich/read_it/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
