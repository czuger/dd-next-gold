I18n.config.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

I18n.config.available_locales = [ :fr, :en ]
I18n.default_locale = :en