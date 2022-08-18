class Api::V1::PlansController < Api::BaseController
  before_action :find_plan, only: %i[show]

  def index
    plans = Plan.all
    json_success_response('All Plans', plans)
  end

  def show
    json_success_response('Plan Detail', @plan)
  end

  private

    def find_plan
      @plan = Plan.find params[:id]
    end
end
