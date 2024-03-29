Rails.application.routes.draw do

  LOCALES = /en|pt\-BR/

  scope "(:locale)", :locale => LOCALES do
    resources :rooms
    resources :users

    #resource pois existe apenas uma confirmação (recurso singleton)
    resource :confirmation, :only => [:show]

    # rotas para seções
    resource :user_sessions, :only => [:create, :new, :destroy]
  end

  # necessário especificar método em que irá pegar o symbol :locale
  # https://stackoverflow.com/questions/19798466/rails-4-you-should-not-use-the-match-method-in-your-router-without-specifying
  match '/:locale' => 'home#index', :via => [:get], :locale => LOCALES
  root :to => "home#index"
end
