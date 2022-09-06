include ApplicationHelper

ActiveAdmin.register NftEvent do
  permit_params :name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :twitter_link, :discord_link, :website_link, :market_place_link, :email, :specific_request, :plan_id, :approved, :twitter_follower_count, :discord_follower_count, :marketplace_follower_count, :slug, :avatar

  member_action :toggle_accept, method: :post, only: :index do
    nft_event = NftEvent.find(params[:nft_id])
    if nft_event.present?
      nft_event.update(approved: params[:approved])
      redirect_to admin_nft_events_path, notice: params[:approved] == "true" ? "Nft Event Approved" : "Nft Event Not Approved"
    end
  end


  index do
    column :name
    column 'Description' do |nft|
      nft.description.truncate(30)
    end
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
    column :approved
    column :plan
    column :created_at
    column 'Approve Action' do |nft|
      link_to("Approve", toggle_accept_admin_nft_event_path(nft, nft_id: nft.id, approved: true), method: :post) + " | " + link_to("Disapprove", toggle_accept_admin_nft_event_path(nft, nft_id: nft.id, approved: false), method: :post)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :blockchain
      row "Image" do |nft|
        link_to image_tag(url_for(nft.avatar), height: '200px'), url_for(nft.avatar), target: :_blank if nft.avatar.attached?
      end
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
      row :approved
      row :plan
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :blockchain
      f.input :plan
      f.input :collection_count
      f.input :trait_count
      f.input :sale_price
      f.input :pre_sale_price
      f.input :pre_sale_date
      f.input :public_sale_date
      f.input :twitter_link
      f.input :discord_link
      f.input :website_link
      f.input :market_place_link
      f.input :avatar, as: :file
      f.input :email
      f.input :specific_request
      f.input :twitter_follower_count
      f.input :discord_follower_count
      f.input :marketplace_follower_count
      f.input :approved
      f.actions
    end
  end
end