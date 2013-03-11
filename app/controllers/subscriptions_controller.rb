class SubscriptionsController < ApplicationController
  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    # @subscription = Subscription.new(params[:subscription])
    @subscription = Subscription.new( subscription_params )
    if @subscription.save_with_payment
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  private

  def subscription_params
    # specialize this private method with per-user checking of permissible attributes with params.require :
      params.require(:subscription).permit(:name, :email, :paymill_id, :plan_id, :paymill_card_token)
  end
end
