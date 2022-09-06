class AddSlugToNftEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :nft_events, :slug, :string
  end
end
