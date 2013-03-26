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

* to load it up

    require 'arg0'

* to check if a bool-type switch is provided

    Arg0::Console.switch?('--is-arg')
    Arg0::Console.switch?(['-isarg', '--is-arg']) # synonymous args

* returning array of (empty or) Value(s) provided after --my-arg at ARGV

    Arg0::Console.value_for('--my-arg')
    is same as Arg0::Console.values('--my-arg')

>

    Arg0::Console.value_for(['-myarg', '--my-arg']) # synonymous args
    is same as Arg0::Console.values(['-myarg', '--my-arg'])


* returning the first value (not array of all) for any switch

    Arg0::Console.value('--my-arg')
    Arg0::Console.value(['-myarg', '--my-arg']) # synonymous args


* returning Hash for all the Arguments provided as argument on console

     suppose command run was
     $ arg0_based_cmd -src ./lib -type html -v -l ./log/app.log start

>

     Arg0::Console.keyring
     # will return {'-src' => './lib', '-type' => 'html', '-v' => true, '-l' => './log/app', 'start' => :data  }


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
