require_relative 'dice_creator_service'
require_relative 'dice_roller'

dices_params = [
  { faces: 5, count: 3 },
  { faces: 20, count: 5 },
  { faces: 4, count: 4 }
]

dices = DiceCreatorService.new(dices_params).call.dices

DiceRoller.new(dices).roll_all_dices.print_results
