class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :user_id
      t.string :friend_id
      t.integer :option

      t.timestamps null: false
    end
  end
end
