# YourBase RSpec Accelerator 

## What is this?

This is a Ruby gem you can use in conjunction with [YourBase](https://yourbase.io)

## What does it do?

YourBase has a unique test acceleration that records the execution of your tests
and builds a dependency graph that it can use to bypass tests that do not need
to be run based on the changes in a commit. This helps to make those commands
much finer-grained enabling more acceleration. 

To achieve this, when running in the YourBase CI, this gem will load a
lighweight wrapper for RSpec that will determine if an example group needs to
run based on the YourBase runtime dependency graph. 

## How do I use this?

Simply add `yourbase-rspec-accelerator` to your Gemfile; when you run your tests
locally it will have no impact at all, other than notifying that it won't
accelerate your tests. When you run your tests in the YourBase CI, they will be
accelerated where possible. 

