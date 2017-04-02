class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :items, through: :user_items
  has_many :user_items
  has_many :won_items, class_name: 'Item', foreign_key: 'user_id'

  after_create :assign_default_role

  def active_bids
    items.where(winner: nil)
  end

  def lost_draws
    Item.drawn.where.not(winner: self) & items
  end

  def admin?
    has_role? :admin
  end

  def ban
    add_role(:banned)
  end

  def make_admin
    add_role(:admin)
  end

  def unban
    remove_role(:banned)
  end

  def remove_admin
    remove_role(:admin)
  end

  private

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
