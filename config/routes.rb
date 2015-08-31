Rails.application.routes.draw do

  get 'pages/queries'		

  devise_for :users
  resources :projects do
  	resources :tasks do
			member do
				patch :complete
			end
  	end
	end

	root "projects#index"
end
