# Mina Rbenv Addons

This gem adds support for installing and upgrading ruby and rbenv for mina.

## Installation

Add this line to your application's Gemfile:

    gem 'mina-rbenv-addons'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-rbenv-addons

## Usage

Add this to your `Minafile` or `config/deploy.rb`

    require 'mina/rbenv/addons'

Use one of the following commands:

    $ mina rbenv:setup
    $ mina rbenv:upgrade
    $ mina rbenv:install

I also added a couple of new options you can set in order to specify the

* Ruby version you want: `rbenv_ruby_version`
* Rbenv git URL to use: `rbenv_git_url`
* Ruby build git URL to use: `ruby_build_git_url`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
