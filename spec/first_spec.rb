require 'spec_helper.rb'
require "set"

describe YourBase::RSpec::Skipper do 
  it 'runs' do 
    expect(5+1).to eq(6)
  end

  it "uses a set" do 
    s = Set.new()
    s.add(1)
    s.add(2)
    expect(s.include?(1)).to eq(true)
  end
end
