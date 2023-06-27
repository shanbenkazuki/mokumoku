class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followed_id
    add_index :follows, [:follower_id, :followed_id], unique: true
  end
end
