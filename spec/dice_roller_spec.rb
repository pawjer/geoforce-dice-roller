require 'spec_helper'
require_relative '../dice_roller'

RSpec.describe DiceRoller do
  it 'validates input' do
    expect { DiceRoller.new([Dice.new(5), Dice.new(10)]) }.not_to raise_error
    expect { DiceRoller.new([]) }.to raise_error(ArgumentError)
    expect { DiceRoller.new([1, 2, 3])}.to raise_error(ArgumentError)
  end

  it 'rolls all dices' do
    dices = [
      Dice.new(3),
      Dice.new(5),
      Dice.new(7)
    ]

    dice_roller = DiceRoller.new(dices)
    expect { dice_roller.roll_all_dices }.not_to raise_error
    expect(dice_roller.roll_all_dices[:total]).to be_between(3, 15)
  end
end

