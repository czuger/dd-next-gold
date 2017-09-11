class GoldController < ApplicationController

  # caches_action :weight

  def weight
    I18n.locale = params[:locale] if params[:locale]
  end

end
