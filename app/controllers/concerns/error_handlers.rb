module Concerns::ErrorHandlers
  extend ::ActiveSupport::Concern

  def render_unprocessable_entity(err)
    render json: [{ message: err.message }], status: :unprocessable_entity
  end

  def render_not_found(err)
    render json: [{ message: err.message }], status: :not_found
  end
end
