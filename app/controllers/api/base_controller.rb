class Api::BaseController < ApplicationController
  before_action :adjust_request_format
  around_action :api

  VALIDATION_ERROR = 10

protected

  def render_404(exception = nil, options = { render_items: false })
    #TODO implement logging
    render_api_response({}, status: 404)
  end

  def default_render(*)
  end

  def api
    result = yield
    render_api_response(result) unless performed?
  end

  def render_api_response(hash = {}, options = {})
    status = options[:status] || 200
    render(json: hash, status: status)
  end

  def adjust_request_format
    request.format = :json if request.format == :html
  end

  def render_record_validation_error(record)
    render_api_error(
      VALIDATION_ERROR,
      errors: record.errors
    )
  end

  def render_api_error(code, errors)
    hash = generate_api_message_hash(code, errors)

    render_api_response(hash, status: 400)
  end

  def generate_api_message_hash(code, validation_errors = nil)
    hash = {
      code: code,
    }


    unless validation_errors.nil?
      hash[:errors] = validation_errors[:errors].messages.map do |field, message|
        {
          field: field.to_s,
          value: Array(message).join(', ')
        }
      end
    end

    hash
  end
end