# YourBase RSpec Skipper Helper

## What is this?

This is a Ruby gem you can use in conjunction with [YourBase](https://yourbase.io)

## What does it do?

YourBase has a unique test acceleration that records the execution of your tests
and builds a dependency graph that it can use to bypass tests that do not need
to be run based on the changes in a commit. This helps to make those commands
much finer-grained enabling more acceleration. 

This gem extends RSpec's core Rake task to expand out your list of spec tests and 
then run them separately. 

For example, if you don't specify a pattern, RSpec will default to 
`spec/**{,/*/**}/*_spec.rb`; given a `spec` directory with three spec files:
[`user_spec.rb`, `cart_spec.rb`, `tax_spec.rb`] instead of running RSpec as one
exec'd command with the pattern, it will run RSpec three times, each with
YourBase's `skipper`. 

## Why is this useful?

In order to see the benefits of acceleration it helps to have multiple,
fine-grained, processes that can be analyzed and then skipped. RSpec 
by default runs as one single monolithic process; as a result there are fewer
opportunities to skip parts of your tests. This gem automatically takes care of
that for you.

## How do I use this?

Simply add `yourbase_rspec_skipper` to your Gemfile and then `require
yourbase_rspec_skipper` in your Rake file. 
