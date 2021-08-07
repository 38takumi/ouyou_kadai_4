class RenameUserCommentIdColumnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :user_comment_id, :user_id
  end
end
