class RenameTextColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :text, :comment_text
  end
end
