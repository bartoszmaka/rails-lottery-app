class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  private

  def assign_default_role
    add_role(:user) if role.blank?
  end
end
