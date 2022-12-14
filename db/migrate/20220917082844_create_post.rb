# frozen_string_literal: true

class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :commentsCounter
      t.integer :likesCounter

      t.timestamps
    end
  end
end
