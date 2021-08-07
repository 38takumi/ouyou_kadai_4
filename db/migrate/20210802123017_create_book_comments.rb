class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      
      t.text :user_comment
      t.integer :user_comment_id

      t.timestamps
    end
  end
end
