Rails.application.configure do
  config.action_controller.page_cache_directory = "#{Rails.root}/public/cached_pages"
end