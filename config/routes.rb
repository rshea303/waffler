Rails.application.routes.draw do

  resources :projects do
    resources :items
  end

end
