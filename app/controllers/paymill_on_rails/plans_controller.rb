require_dependency "paymill_on_rails/application_controller"

module PaymillOnRails
  class PlansController < ApplicationController
    #before_action :set_plan, only: [:show, :edit, :update, :destroy]

    # GET /plans
    def index
      @plans = Plan.order("price")
    end

#    # GET /plans/1
#    def show
#    end
#
#    # GET /plans/new
#    def new
#      @plan = Plan.new
#    end
#
#    # GET /plans/1/edit
#    def edit
#    end
#
#    # POST /plans
#    def create
#      @plan = Plan.new(plan_params)
#
#      if @plan.save
#        redirect_to @plan, notice: 'Plan was successfully created.'
#      else
#        render action: 'new'
#      end
#    end
#
#    # PATCH/PUT /plans/1
#    def update
#      if @plan.update(plan_params)
#        redirect_to @plan, notice: 'Plan was successfully updated.'
#      else
#        render action: 'edit'
#      end
#    end
#
#    # DELETE /plans/1
#    def destroy
#      @plan.destroy
#      redirect_to plans_url, notice: 'Plan was successfully destroyed.'
#    end
#
#    private
#      # Use callbacks to share common setup or constraints between actions.
#      def set_plan
#        @plan = Plan.find(params[:id])
#      end
#
#      # Only allow a trusted parameter "white list" through.
#      def plan_params
#        params[:plan]
#      end

  end
end
