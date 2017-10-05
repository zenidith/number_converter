require 'rails_helper'

RSpec.describe NumberConversion, type: :model do
  it "should convert numbers to binary" do
    n = NumberConversion.new(number: 7, base: 2)
    expect(n.result).to eq('111')

    n = NumberConversion.new(number: 9, base: 2)
    expect(n.result).to eq('1001')

    expect(NumberConversion.new(number: 189, base: 2).result).to eq('10111101')
    expect(NumberConversion.new(number: 32, base: 2).result).to eq('100000')
    expect(NumberConversion.new(number: 8534, base: 2).result).to eq('10000101010110')
    expect(NumberConversion.new(number: 0, base: 2).result).to eq('0')
  end

  it "should convert numbers to base 3" do
    expect(NumberConversion.new(number: 189, base: 3).result).to eq('21000')
    expect(NumberConversion.new(number: 32, base: 3).result).to eq('1012')
    expect(NumberConversion.new(number: 8534, base: 3).result).to eq('102201002')
    expect(NumberConversion.new(number: 0, base: 3).result).to eq('0')
    expect(NumberConversion.new(number: 1, base: 3).result).to eq('1')
    expect(NumberConversion.new(number: 2, base: 3).result).to eq('2')
    expect(NumberConversion.new(number: 3, base: 3).result).to eq('10')
    expect(NumberConversion.new(number: 4, base: 3).result).to eq('11')
    expect(NumberConversion.new(number: 5, base: 3).result).to eq('12')
    expect(NumberConversion.new(number: 6, base: 3).result).to eq('20')

    (0..1000).each do |n|
      actual = n.to_s(3)
      expect(
        NumberConversion.new(number: n, base: 3).result
      ).to eq(actual)
    end
  end

  it "should convert numbers to hexadecimal" do
    expect(NumberConversion.new(number: 0, base: 16).result).to eq('0')
    expect(NumberConversion.new(number: 1, base: 16).result).to eq('1')
    expect(NumberConversion.new(number: 9, base: 16).result).to eq('9')
    expect(NumberConversion.new(number: 10, base: 16).result).to eq('a')
    expect(NumberConversion.new(number: 15, base: 16).result).to eq('f')
    expect(NumberConversion.new(number: 16, base: 16).result).to eq('10')
    expect(NumberConversion.new(number: 255, base: 16).result).to eq('ff')
    expect(NumberConversion.new(number: 256, base: 16).result).to eq('100')
    expect(NumberConversion.new(number: 8534, base: 16).result).to eq('2156')
  end

  it "should allow valid values" do
    expect(NumberConversion.new(number: 9, base: 16)).to be_valid
    expect(NumberConversion.new(number: 9, base: 2)).to be_valid
    expect(NumberConversion.new(number: 9, base: 7)).to be_valid
    expect(NumberConversion.new(number: 0, base: 7)).to be_valid
  end

  it "should disallow invalid numbers" do
    expect(NumberConversion.new(number: -1, base: 5)).to be_invalid
    expect(NumberConversion.new(number: -40, base: 5)).to be_invalid
    expect(NumberConversion.new(number: 'abc', base: 5)).to be_invalid
  end

  it "should disallow invalid bases" do
    expect(NumberConversion.new(number: 5, base: 0)).to be_invalid
    expect(NumberConversion.new(number: 5, base: 1)).to be_invalid
    expect(NumberConversion.new(number: 5, base: 'abc')).to be_invalid
  end

  it "should disallow missing required attributes" do
    expect(NumberConversion.new).to be_invalid
    expect(NumberConversion.new(number: '', base: '')).to be_invalid
  end
end
