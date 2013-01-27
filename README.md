# Arg0

It's just here to handle command line args. Mainly optional via switches.

## Installation

Add this line to your application's Gemfile:

    gem 'arg0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arg0

## Usage

to load it up

    require 'arg0'

to check if a bool-type switch is provided

    Arg0::Console.switch?('--is-arg')
    Arg0::Console.switch?(['-isarg', '--is-arg']) # synonymous args

returning array of (empty or) Value(s) provided after --my-arg at ARGV

    Arg0::Console.value_for('--my-arg')
    Arg0::Console.value_for(['-myarg', '--my-arg']) # synonymous args

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
