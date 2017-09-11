class GoldController < ApplicationController

  # Need to clear cache on deployment, otherwise CRFS fail.
  # caches_action :weight

  def weight
    I18n.locale = params[:locale] if params[:locale]
  end

end
