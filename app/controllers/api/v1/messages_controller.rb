module Api
  module V1
    class MessagesController < ApplicationController
      
      def index
        messages = Message.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded Messages', data:messages},status: :ok
      end

      def show
        message = Message.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Message', data:message},status: :ok
      end

      def create
        account = Account.find_by_name(params[:account_name])
        if account.present?
        
          message = account.messages.new(message_params)

          if message.occurred_at.nil?
            message.occurred_at = DateTime.now
          end

          if message.save
            render json: {status: 'SUCCESS', message: 'Saved Message', data:message},status: :ok
          else
            render json: {status: 'ERROR', message: 'Message not saved', data:message.errors},status: :unprocessable_entity
          end
        else
          render json: {status: 'ERROR', message: 'Account provided does not exist'},status: :unprocessable_entity
        end
      end

      def destroy
        message = Message.find(params[:id])
        message.destroy
        render json: {status: "SUCCESS", message: "Deleted account", data:message},status: :ok
      end

      def update
        message = Message.find(params[:id])

        if message.update_attributes(message_params)
          render json: {status: 'SUCCESS', message: 'Updated Message', data:message},status: :ok
        else
          render json: {status: 'ERROR', message: 'Message not updated', data:message.errors},status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.permit(:content, :occurred_at)
      end

    end
  end
end