Rails.application.routes.draw do
  apipie

  namespace :api do
    resources :pulls, :only => [:create, :destroy] do
      resources :merges, :only => [:create, :index], :controller => 'pulls/merges' do

      end
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
