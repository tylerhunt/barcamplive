BarCampLive::Application.routes.draw do
  resource :session

  resources :venues do
    resources :talks
  end

  namespace :admin do
    resources :venues, except: :show do
      resources :talks, except: :show
    end

    root to: 'venues#index'
  end

  root to: 'venues#index'
end
