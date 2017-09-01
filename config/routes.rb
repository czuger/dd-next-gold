Rails.application.routes.draw do

  get 'gold/weight'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  put 'set_locale/:locale', constraints: { locale: /en|fr/ }, to: 'locales#set'

  root 'gold#weight'
end
