class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    #No user can like twice on a single post,here check user id unique for the post id
    add_index:likes, [:user_id, :post_id], unique:true
  end
end
