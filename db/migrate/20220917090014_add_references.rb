# frozen_string_literal: true

class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true
    add_reference :likes, :post, null: false, foreign_key: true
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
    add_reference :posts, :user, null: false, foreign_key: true
  end
end
