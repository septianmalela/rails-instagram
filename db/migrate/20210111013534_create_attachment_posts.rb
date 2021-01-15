class CreateAttachmentPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :attachment_posts do |t|
      t.integer :post_id
      t.string :foto

      t.timestamps
    end
  end
end
