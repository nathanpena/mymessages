Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :accounts
      resources :messages
    end
  end
end