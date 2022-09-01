ActiveAdmin.register NftEvent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :twitter_link, :discord_link, :website_link, :market_place_link, :email, :specific_request, :plan_id, :approved
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :tags, :twitter_link, :discord_link, :website_link, :market_place_link, :email, :specific_request, :plan_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
