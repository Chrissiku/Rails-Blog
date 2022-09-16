class RemoveReferences < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :authorId  
    remove_column :likes, :posts_id 
    remove_column :comments, :authorId  
    remove_column :comments, :posts_id 
    remove_column :posts, :authorId  
  end
end
