# frozen_string_literal: true

# Dice Creator Service create required dices
# input: [{ faces: int, count: int }, {faces: int,  count: int}...]

class DiceCreatorService
  attr_reader :dices

  def initialize(input)
    @input = input
    validate_input

    @dices = []
  end

  def create
    @input.each do |params|
      params[:count].times do
        @dices << Dice.new(params[:faces])
      end
    end
    self
  end
  alias call create

  private

  def validate_input
    raise ::ArgumentError, 'Param should be a hash' unless @input.is_a? Array

    @input.each do |params|
      raise ::ArgumentError, 'Each param should be a Hash' unless params.is_a? Hash

      unless params.keys.sort == [:count, :faces]
        raise ::ArgumentError, 'Each param should contain keys: :faces and :count'
      end

      unless params.values.all? { |val| val.is_a? Integer; val.positive? }
        raise ::ArgumentError, 'Each param should have a integer, positive value'
      end
    end
  end
end
