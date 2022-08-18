module Api
  class BaseController < ApplicationController
    include Response
    skip_before_action :verify_authenticity_token
    # before_action :set_pagination_params
    # attr_reader :current_user
    attr_reader :pagination_params
    include ActiveStorage::SetCurrent
    # before_action :authenticate_user
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

    private

    def record_not_found_error
      json_error_response('Record Not Found.', params)
    end

  end
end
