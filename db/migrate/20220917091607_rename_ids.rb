# frozen_string_literal: true

class RenameIds < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :authorId
    rename_column :likes, :user_id, :authorId
    rename_column :posts, :user_id, :authorId
  end
end
