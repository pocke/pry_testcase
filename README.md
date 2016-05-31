# PryTestcase

Run binding.pry only specified testcase.

[![Gem Version](https://badge.fury.io/rb/pry_testcase.svg)](https://badge.fury.io/rb/pry_testcase)
[![Build Status](https://travis-ci.org/pocke/pry_testcase.svg?branch=master)](https://travis-ci.org/pocke/pry_testcase)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pry_testcase'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pry_testcase

## Usage

PryTestcase is instead of `binding.pry` in test.

```ruby
# Post mesage to twitter
def say(msg, param)
  opt = to_opt(param)
  opt.message = msg

  # here
  PryTestcase.pry

  send_to_twitter(opt)
end
```

```ruby
# spec_helper.rb
require 'pry_testcase/rspec'
```

```ruby
describe '#say' do
  context 'case1' do
    it 'should send to twitter' do
      ...
    end
  end

  # here
  context 'case2', :with_pry_testcase do
    it 'should send to twitter' do
      ...
    end
  end
end
```

`PryTestcase.pry` works as `binding.pry` in `case2` only.
In `case1`, `PryTestcase.pry` does nothing.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/pry_testcase.


License
-------

These codes are licensed under CC0.

[![CC0](http://i.creativecommons.org/p/zero/1.0/88x31.png "CC0")](http://creativecommons.org/publicdomain/zero/1.0/deed.en)
