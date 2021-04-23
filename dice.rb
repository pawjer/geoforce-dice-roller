# frozen_string_literal: true

### Random dice
# init: Dice.new(sides)
# roll: Dice.new(sides).roll
# check id: Dice.new(sides).id

class Dice
  attr_reader :faces, :id, :name

  def initialize(faces)
    raise ::ArgumentError, 'Use an integer' unless faces.is_a? Integer
    raise ::ArgumentError, 'Unsupported faces count' unless faces.positive?

    @faces = faces
    @id = "#{random_string}_#{name}"
  end

  def name
    "#{faces}-side dice"
  end

  def roll
    rand(1..faces)
  end

  private

  def random_string
    (0...4).map { (65 + rand(26)).chr }.join
  end
end
