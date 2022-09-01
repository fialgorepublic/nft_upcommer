class Api::V1::NftEventsController < Api::BaseController
  before_action :find_nft_event, only: %i[show update_plan]

  def index
    nft_events = \
    if params[:featured]
      Plan.featured.first.nft_events
    elsif params[:bluechip]
      Plan.bluechip.first.nft_events
    elsif params[:upcoming]
      NftEvent.where("public_sale_date > ?", Date.today)
    elsif params[:today]
      NftEvent.where("public_sale_date = ?", Date.today)
    elsif params[:ongoing]
      NftEvent.where("public_sale_date < ?", Date.today)
      else
        NftEvent.all
    end
    json_success_response("All NFT Events", nft_events.collect{|nft_event| get_nft_event(nft_event)})
  end

  def create
    nft_event = NftEvent.new(nft_events_params)
    if nft_event.save
      json_success_response('NFT Event Created Successfully', get_nft_event(nft_event))
      GetSocialFollowers.perform_async(nft_event.id)
    else
      json_error_response('There are some issues', nft_event.errors)
    end
  end

  def show
    json_success_response("NFT Event Detail", get_nft_event(@nft_event))
  end

  def slider_nft
    nft_events = NftEvent.order(id: :desc).limit(6)
    json_success_response("All NFT Events", nft_events.collect{|nft_event| get_nft_event(nft_event)})
  end

  def search_nft
    nft_events = \
    if params[:featured] == "true"
      Plan.featured.first.nft_events.where("name ILIKE ? OR description ILIKE ? ", "#{params[:title]}%", "#{params[:title]}%").order("#{params[:sort]} #{params[:order]}")
    elsif params[:featured] == "false" || params[:feature].nil?
      NftEvent.where("name ILIKE ? OR description ILIKE ? ", "#{params[:title]}%", "#{params[:title]}%").order("#{params[:sort]} #{params[:order]}")
    else
      NftEvent.all
    end
    json_success_response("All NFT Events", nft_events.collect{|nft_event| get_nft_event(nft_event)})
  end

  def update_plan
    if params[:plan_id].present?
      if @nft_event.update(plan_id: params[:plan_id])
        json_success_response("Plan added ", get_nft_event(@nft_event))
      else
          json_error_response('There are some issues', @nft_event.errors)
      end
    end
  end

  private

    def nft_events_params
      params.permit(:name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :official_links, :avatar, :twitter_link, :discord_link, :website_link, :market_place_link, :plan_id, tags: [])
    end

    def find_nft_event
      @nft_event = NftEvent.find params[:id]
    end

    def get_nft_event(nft_event)
      nft_event.attributes.merge(avatar: nft_event.avatar.attached? ? nft_event.avatar.service_url : nil)
    end
end
