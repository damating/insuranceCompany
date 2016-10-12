Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'application#index'

  get 'o_firmie' => 'application#company_info'
  get 'oferta' => 'application#services'
  get 'kalkulator' => 'application#calculate'
  get 'do_pobrania' => 'application#download'
  get 'kontakt' => 'application#contact'
end
