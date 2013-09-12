class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @investment.update(investment_params)
        @investment.amount = @investment.calculate_roi.first
        @investment.profit = @investment.calculate_roi.last
        @investment.save!
         
        flash[:notice] = 'Return of Investment was successfully calculated.'
        format.html { render action: 'show' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    #callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:sq_feet, :cost, :sale_val)
    end
end
