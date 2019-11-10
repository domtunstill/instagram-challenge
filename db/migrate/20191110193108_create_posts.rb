class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :message
      t.timestamps
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_posts_on_user_id"
    end
  end
end
