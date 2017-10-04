require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it "should convert to binary" do
    expect(NumberConversion.new(number: 3, base: 2).output).to eq('11')
    expect(NumberConversion.new(number: 7, base: 2).output).to eq('111')
    expect(NumberConversion.new(number: 8, base: 2).output).to eq('1000')
    expect(NumberConversion.new(number: 0, base: 2).output).to eq('0')
  end

  it "should convert to hexadecimal" do
    expect(NumberConversion.new(number: 0, base: 16).output).to eq('0')
    expect(NumberConversion.new(number: 1, base: 16).output).to eq('1')
    expect(NumberConversion.new(number: 10, base: 16).output).to eq('a')
    expect(NumberConversion.new(number: 15, base: 16).output).to eq('f')
    expect(NumberConversion.new(number: 255, base: 16).output).to eq('ff')
    expect(NumberConversion.new(number: 256, base: 16).output).to eq('100')
  end

  it "should allow valid numbers" do
    expect(NumberConversion.new(number: 0, base: 16)).to be_valid
    expect(NumberConversion.new(number: 256, base: 16)).to be_valid
  end

  it "should disallow invalid numbers" do
    expect(NumberConversion.new(number: -1, base: 16)).to be_invalid
  end
  
  it "should disallow invalid bases" do
    expect(NumberConversion.new(number: 256, base: 0).output).to eq('indeterminate')
    expect(NumberConversion.new(number: 256, base: 0)).to be_invalid
    expect(NumberConversion.new(number: 256, base: 1)).to be_invalid
  end
end
