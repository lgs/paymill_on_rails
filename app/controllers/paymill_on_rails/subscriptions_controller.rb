require_dependency "paymill_on_rails/application_controller"

module PaymillOnRails
  class SubscriptionsController < ApplicationController
    before_action :set_subscription, only: [:show]

    def show
    end

    def new
      plan = Plan.find(params[:plan_id])
      @subscription = plan.subscriptions.build
    end

    def create
      @subscription = Subscription.new( subscription_params )
      if @subscription.save_with_payment
        redirect_to @subscription, :notice => "Thank you for subscribing!"
      else
        render :new
      end
    end

    private

      # Only allow a trusted parameter "white list" through with ( see Rails 4 Strong Parameters ).
      def subscription_params
        # specialize this private method with per-user checking of permissible attributes with params.require :
          params.require(:subscription).permit(:name, :email, :paymill_id, :plan_id, :paymill_card_token)
      end

      # Use callbacks to share common setup or constraints between actions ( see Rails 4 Strong Parameters ).
      def set_subscription
        @subscription = Subscription.find(params[:id])
      end

  end
end
