class Api::V1::PlansController < Api::BaseController
  before_action :find_plan, only: %i[show]

  def index
    plans = Plan.all
    json_success_response('All Plans', plans.collect{|plan| get_plan_image(plan)})
  end

  def show
    json_success_response('Plan Detail', get_plan_image(@plan))
  end

  private

    def find_plan
      @plan = Plan.find params[:id]
    end

    def get_plan_image(plan)
      plan.attributes.merge(image: plan.image.attached? ? plan.image.service_url : nil)
    end
end
