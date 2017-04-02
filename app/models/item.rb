class Item < ApplicationRecord
  paginates_per 6
  has_many :users, through: :user_items
  has_many :user_items
  belongs_to :winner, class_name: 'User', foreign_key: :user_id, optional: true
  validates :name, presence: true

  scope :bidable, -> { where(winner: nil) }
  scope :drawable, -> { bidable.where('users_count > 1') }

  def won?
    return true if winner
    false
  end

  def already_bid?(user)
    return true if users.include?(user)
    false
  end

  def bidable?(user)
    return true unless won? || already_bid?(user)
    false
  end

  def drawable?
    return true unless won? || users.count < 2
    false
  end
end
