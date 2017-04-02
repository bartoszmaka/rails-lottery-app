class Draw < ActiveInteraction::Base
  object :item, class: Item

  def execute
    return unless item_drawable?
    draw
    'Item succesfully drawn'
  end

  private

  def draw
    item.update(winner: item.users.sample)
  end

  def item_drawable?
    return true if item.drawable?
    errors.add(:already_won, "You can't run draw on already won item") if item.won?
    errors.add(:not_enough_bidders, "You can't run draw, if there is less than 2 bidders") if item.users.count < 2
    false
  end
end
