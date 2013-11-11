require_dependency "paymill_on_rails/application_controller"

module PaymillOnRails
  class SubscriptionsController < ApplicationController
    before_action :set_subscription, only: [:show, :edit, :update, :destroy]

    # GET /subscriptions
    #def index
    #  @subscriptions = Subscription.all
    #end

    # GET /subscriptions/1
    def show
      @subscription = Subscription.find(params[:id])
    end

    # GET /subscriptions/new
    def new
      plan = Plan.find(params[:plan_id])
      @subscription = plan.subscriptions.build
    end

    # GET /subscriptions/1/edit
    #def edit
    #end

    # POST /subscriptions
    def create
      @subscription = Subscription.new( subscription_params )
      if @subscription.save_with_payment
        redirect_to @subscription, :notice => "Thank you for subscribing!"
      else
        render :new
      end
    end

    # PATCH/PUT /subscriptions/1
    #def update
    #  if @subscription.update(subscription_params)
    #    redirect_to @subscription, notice: 'Subscription was successfully updated.'
    #  else
    #    render action: 'edit'
    #  end
    #end

    # DELETE /subscriptions/1
    #def destroy
    #  @subscription.destroy
    #  redirect_to subscriptions_url, notice: 'Subscription was successfully destroyed.'
    #end

    private

      # orig
      #def subscription_params
      #  params[:subscription]
      #end

      # Only allow a trusted parameter "white list" through.
      def subscription_params
        # specialize this private method with per-user checking of permissible attributes with params.require :
          params.require(:subscription).permit(:name, :email, :paymill_id, :plan_id, :paymill_card_token)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_subscription
        @subscription = Subscription.find(params[:id])
      end
  end
end
