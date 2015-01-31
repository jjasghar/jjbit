require 'spec_helper'

describe Jjbit::Shortener do

  it 'has my_token and the token' do
    shortener = Jjbit::Shortener.new("my_token")
    expect(shortener.token).to eq("my_token")
  end

  it 'should have another_token as the token' do
    shortener = Jjbit::Shortener.new("another_token")
    expect(shortener.token).to eq("another_token")
  end

  it 'return a shorten url and the string' do
    VCR.use_cassette("shortener") do
      shortener = Jjbit::Shortener.new("this_is_fake")
      expect(shortener.shorten("http://google.com")).to eq("http://bit.ly/1ra0tQp")
    end
  end

  it 'should raise not_a_url because its not a url' do
    shortener = Jjbit::Shortener.new("0c984385a6d2462b9d7e1ec370e4251e5eaea9dc")
    expect{ shortener.shorten("NOT_A_URL") }.to raise_error(Jjbit::NotAUrl)
  end

  it 'should raise not_a_http because its not an http url' do
    shortener = Jjbit::Shortener.new("0c984385a6d2462b9d7e1ec370e4251e5eaea9dc")
    expect{ shortener.shorten("git://github.com/jjasghar/.emacs.d.git") }.to raise_error("Not an HTTP")
  end


end
