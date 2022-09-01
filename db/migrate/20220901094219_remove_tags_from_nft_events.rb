class RemoveTagsFromNftEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :nft_events, :tags, :text
    add_column :nft_events, :approved, :boolean, default: false
  end
end
