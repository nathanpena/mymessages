Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :accounts do
        resources :messages
      end
    end
  end
end