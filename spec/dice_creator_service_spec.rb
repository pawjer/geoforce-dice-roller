require 'spec_helper'
require_relative '../dice_creator_service'
require 'pry'

RSpec.describe DiceCreatorService do
  let(:valid_input) { [{ faces: 3, count: 4 }, { faces: 11, count: 1 }, { faces: 20, count: 5 }] }
  let(:invalid_input) { [faces: 3.5, count: 4, size: 'huuuuge!'] }


  it 'validates input' do
    expect { DiceCreatorService.new(valid_input).call }.not_to raise_error
    expect { DiceCreatorService.new(invalid_input).call }.to raise_error(ArgumentError)
  end

  it 'creates proper dices' do
    expected_output = [ 3, 3, 3, 3, 11, 20, 20, 20, 20, 20]
    created_dices = DiceCreatorService.new(valid_input).call.dices
    sides_map = created_dices.map(&:faces)
    expect(sides_map).to eq(expected_output)
  end
end

