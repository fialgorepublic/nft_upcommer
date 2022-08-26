class CreateNftEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :nft_events do |t|
      t.string :name
      t.text :description
      t.string :blockchain
      t.integer :collection_count
      t.integer :trait_count
      t.float :sale_price
      t.float :pre_sale_price
      t.date :pre_sale_date
      t.date :public_sale_date
      t.text :tags, array: true, default: []
      t.string :twitter_link
      t.integer :twitter_follower_count
      t.integer :discord_follower_count
      t.integer :marketplace_follower_count

      t.string :discord_link
      t.string :website_link
      t.string :market_place_link
      t.string :email
      t.text   :specific_request
      t.integer :plan_id
      t.timestamps
    end
  end
end
