class Bid < ActiveInteraction::Base
  object :user, class: User
  object :item, class: Item

  def execute
    return unless item_bidable?
    bid
    'Item successfully bidded'
  end

  private

  def bid
    user.items << item
  end

  def item_bidable?
    return true unless item.won? || item.already_bid?(user)
    errors.add(:already_won, "You can't bid already won item") if item.won?
    errors.add(:already_bid, "You can't bid the same item twice!") if item.already_bid?(user)
    false
  end
end
