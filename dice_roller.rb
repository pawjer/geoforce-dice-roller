# frozen_string_literal: true

require_relative 'dice'

class DiceRoller
  def initialize(dices)
    raise ::ArgumentError, 'Pass an Array of Dices' unless dices.is_a? Array
    raise ::ArgumentError, 'Array should not be empty' if dices.empty?
    raise ::ArgumentError, 'UnsupportedDiceType' unless dices.all? { |dice| dice.is_a? Dice }

    @dices = dices
    @result = nil
  end

  def roll_all_dices
    results =
      @dices.map { |dice| roll_a_dice(dice) }

    description = "Rolling #{@dices.size} dices: [#{@dices.map(&:faces).join(',')}]"
    total = results.sum { |roll| roll[:result] }

    @result = { description: description, total: total, results: results }
    self
  end

  def print_results
    puts "DESCRIPTION: #{@result[:description]}"
    puts "TOTAL: #{@result[:total]}"
    @result[:results].each do |result|
      dice = result[:dice]
      puts "#{dice.id} with #{dice.faces} show: #{result[:result]}"
    end
  end

  private

  def roll_a_dice(dice)
    raise ::ArgumentError, 'Use a dice' unless dice.is_a? Dice
    raise ::ArgumentError, 'We don\'t have such a dice' unless @dices.include? dice

    { dice: dice, result: dice.roll }
  end
end
