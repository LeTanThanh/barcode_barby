Rails.application.routes.draw do
  root "barcodes#new"

  resources :barcodes, only: %i(new create show)
end
