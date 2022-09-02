ActiveAdmin.register NftEvent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :twitter_link, :discord_link, :website_link, :market_place_link, :email, :specific_request, :plan_id, :approved, :twitter_follower_count, :discord_follower_count, :marketplace_follower_count, :email, :specific_request
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :tags, :twitter_link, :discord_link, :website_link, :market_place_link, :email, :specific_request, :plan_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end


ActiveAdmin.register NftEvent do
  index do
    column :name
    column :description
    column :blockchain
    column :collection_count
    column :trait_count
    column :sale_price
    column :pre_sale_price
    column :pre_sale_date
    column :public_sale_date
    column :twitter_link
    column :discord_link
    column "Marketplace" do |nft|
      nft.market_place_link
    end
    column :website_link
    column :twitter_follower_count
    column :discord_follower_count
    column :marketplace_follower_count
    column :email
    column :specific_request
    column :plan
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :blockchain
      row :collection_count
      row :trait_count
      row :sale_price
      row :pre_sale_price
      row :pre_sale_date
      row :public_sale_date
      row :twitter_link
      row :discord_link
      row "Marketplace" do |nft|
        nft.market_place_link
      end
      row :website_link
      row :twitter_follower_count
      row :discord_follower_count
      row :marketplace_follower_count
      row :email
      row :specific_request
      row :plan
      row :created_at
    end
  end
end