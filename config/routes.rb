Rails.application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get '/' => 'home#index'
  root 'home#index'
  scope :api do
    resources :converters
  end
end
