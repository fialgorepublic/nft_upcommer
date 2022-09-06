class Api::V1::NftEventsController < Api::BaseController
  before_action :find_nft_event, only: %i[show update_plan]

  def index
    nft_events = \
    if params[:featured]
      NftEvent.approved.where(plan: Plan.featured).page(params[:page]).per(10)
    elsif params[:bluechip]
      NftEvent.approved.where(plan: Plan.bluechip).page(params[:page]).per(10)
    elsif params[:upcoming]
      NftEvent.approved.where("public_sale_date > ?", Time.zone.today).page(params[:page]).per(10)
    elsif params[:sidebar]
      NftEvent.approved.approved.where(plan: Plan.sidebar).page(params[:page]).per(10)
    elsif params[:today]
      NftEvent.approved.where("public_sale_date = ?", Time.zone.today).page(params[:page]).per(10)
    elsif params[:ongoing]
      NftEvent.approved.where(public_sale_date: Time.zone.yesterday..Time.zone.today).page(params[:page]).per(10)
      else
        NftEvent.approved.page(params[:page]).per(10)
    end
    json_success_response("All NFT Events", nft_events.collect{|nft_event| get_nft_event(nft_event)})
  end

  def create
    nft_event = NftEvent.new(nft_events_params)
    nft_event.plan_id = Plan.free.first
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
    nft_events = NftEvent.approved.order(id: :desc).limit(6)
    json_success_response("All NFT Events", nft_events.collect{|nft_event| get_nft_event(nft_event)})
  end

  def search_nft
    order = "#{params[:sort]} #{params[:order]} NULLS LAST" if params[:sort].present? && params[:order].present?
    nft_events = \
    if params[:featured] == "true"
      NftEvent.all_plan_event.where("name ILIKE ? OR description ILIKE ?", "#{params[:title]}%", "#{params[:title]}%").order(order).page(params[:page]).per(10)
    elsif params[:featured] == "false" || params[:feature].nil?
      NftEvent.approved.where("name ILIKE ? OR description ILIKE ?", "#{params[:title]}%", "#{params[:title]}%").order(order).page(params[:page]).per(10)
    else
      NftEvent.approved
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
      params.permit(:name, :description, :blockchain, :collection_count, :trait_count, :sale_price, :pre_sale_price, :pre_sale_date, :public_sale_date, :official_links, :avatar, :twitter_link, :discord_link, :email, :specific_request, :website_link, :market_place_link, :plan_id, tags: [])
    end

    def find_nft_event
      @nft_event = NftEvent.find params[:id]
    end

    def get_nft_event(nft_event)
      nft_event.attributes.merge(avatar: nft_event.avatar.attached? ? nft_event.avatar.service_url : nil)
    end
end
