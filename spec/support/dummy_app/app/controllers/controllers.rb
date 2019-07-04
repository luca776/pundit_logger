require 'pundit_logger'

class ApplicationController < ActionController::Base
  include Pundit

  def root
    head :ok
  end

  rescue_from Pundit::NotAuthorizedError, with: ->{ head :unauthorized }

  private

  def current_user
  end
end

class WidgetsController < ApplicationController
  def index
    @widgets = policy_scope(Widget)
    render json: @widgets
  end

  def show
    @widget = Widget.where(id: params[:id]).first
    authorize @widget
    render json: @widget
  end
end
