module Api
  module V1
    class AccountsController < ApplicationController
      
      def index
        accounts = Account.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded Accounts', data:accounts}, status: :ok
      end

      def show
        account = Account.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Account', data:account}, status: :ok
      end

      def create
        account = Account.new(account_params)

        if account.save
          render json: {status: 'SUCCESS', message: 'Saved Account', data:account}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Account not saved', data:account.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        account = Account.find(params[:id])
        account.destroy
        render json: {status: "SUCCESS", message: "Deleted account", data:account}, status: :ok
      end

      def update
        account = Account.find(params[:id])

        if account.update_attributes(account_params)
          render json: {status: 'SUCCESS', message: 'Updated Account', data:account}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Account not updated', data:account.errors}, status: :unprocessable_entity
        end
      end

      private

      def account_params
        params.permit(:name)
      end

    end
  end
end