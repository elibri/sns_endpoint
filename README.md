# SnsEndpoint

Simple gem containing Sinatra engine, designed to help you utilize SNS http post service.
Use inside Rails (as an engine) or outside - as a standalone application.

## Installation

Add this line to your application's Gemfile:

    gem 'sns_endpoint'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sns_endpoint

## Usage

Configure using SnsEndpoint.setup, providing block, like this:
```ruby
SnsEndpoint.setup do |config|
  config.topics_list = ['first_topic', 'second_topic'] #list of topics that endpoint should respond to subscription request
  config.subscribe_proc = Proc.new { |message| p message } #proc that should be executed when subscribe request got received and responded to, passed argument is message (json object)
  config.message_proc = Proc.new { |message| p message } #proc that should be executed when message got send to endpoint
end
```

for example in Rails initializer.

Use as Rails engine:

* mount in routes.rb:
```ruby
mount SnsEndpoint::Core => "/sns_endpoint"
```

Use as a standalone app:
Example script:
```ruby
SnsEndpoint.setup do |config|
  config.topics_list = ['first_topic', 'second_topic'] #list of topics that endpoint should respond to subscription request
  config.subscribe_proc = Proc.new { |message| p message } #proc that should be executed when subscribe request got received and responded to, passed argument is message (json object)
  config.message_proc = Proc.new { |message| p message } #proc that should be executed when message got send to endpoint
end
SnsEndpoint::Core.run!
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
