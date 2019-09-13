[![Gem Version](https://badge.fury.io/rb/omniauth-classlink.svg)](https://badge.fury.io/rb/omniauth-classlink)

# OmniAuth ClassLink
Unofficial OmniAuth strategy for [ClassLink](https://classlink.com) integration.

# Installation

Add the gem to your application's Gemfile:

```ruby
gem 'omniauth-classlink'
```
And then execute:

```
$ bundle
```

# Usage

First, you need to have your OAuth2 application registered in ClassLink. After creating one, you'll be provided with access key and secret that should be used for configuring the gem. 

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :class_link, 'your-classlink-access-key', 'your-classlink-secret', strategy_class: 'OmniAuth::Strategies::ClassLink'
end
```

Or, alternatively, if you use [Devise](https://github.com/plataformatec/devise), you can put this in the `Devise.setup` section:

```ruby
 config.omniauth :class_link, 
                 'your-classlink-access-key',
                 'your-classlink-secret',
                 strategy_class: 'OmniAuth::Strategies::ClassLink'
```

# Contributing
1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# License
Apache 2.0
