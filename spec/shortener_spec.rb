require 'spec_helper'

describe Jjbit::Shortener do

  it 'has my_token and the token' do
    expander = Jjbit::Shortener.new("my_token")
    expect(expander.token).to eq("my_token")
  end

  it 'should have another_token as the token' do
    expander = Jjbit::Shortener.new("another_token")
    expect(expander.token).to eq("another_token")
  end



end
