class CreateUserItems < ActiveRecord::Migration[5.0]
  def change
    create_table :user_items do |t|
      t.belongs_to :user, index: true
      t.belongs_to :item, index: true
    end
  end
end
