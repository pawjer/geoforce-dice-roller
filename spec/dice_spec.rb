require 'spec_helper'
require_relative '../dice'

RSpec.describe Dice do
  it 'has a proper side count' do
    expect(Dice.new(5).faces).to eq(5)
  end

  it 'has an id' do
    expect(Dice.new(1).id).not_to be_empty
  end

  it 'rolls randomly' do
    expect(Dice.new(100).roll).to be_between(1, 100)
  end

  it 'raises an error if unsupported init param' do
    expect { Dice.new(-12) }.to raise_error(ArgumentError)
    expect { Dice.new(0) }.to raise_error(ArgumentError)
    expect { Dice.new(1.2) }.to raise_error(ArgumentError)
    expect { Dice.new('OMG') }.to raise_error(ArgumentError)
  end
end
