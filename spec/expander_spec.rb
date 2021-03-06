require 'spec_helper'

describe Jjbit::Expander do

  it 'has my_token and the token' do
    expander = Jjbit::Expander.new("my_token")
    expect(expander.token).to eq("my_token")
  end

  it 'should have another_token as the token' do
    expander = Jjbit::Expander.new("another_token")
    expect(expander.token).to eq("another_token")
  end

  it 'return a expand the url and the string' do
    VCR.use_cassette("expander") do
      expander = Jjbit::Expander.new("this_is_fake")
      expect(expander.expand("http://bit.ly/1ra0tQp")).to eq("http://google.com/")
    end
  end

  it 'should raise not_a_url because its not a url' do
    expander = Jjbit::Expander.new("0c984385a6d2462b9d7e1ec370e4251e5eaea9dc")
    expect{ expander.expand("NOT_A_URL") }.to raise_error(Jjbit::NotAUrl)
  end

  it 'should raise not_a_http because its not an http url' do
    expander = Jjbit::Expander.new("0c984385a6d2462b9d7e1ec370e4251e5eaea9dc")
    expect{ expander.expand("git://bit.ly/109et43") }.to raise_error("Not an HTTP")
  end

end
