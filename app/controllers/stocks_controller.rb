class StocksController < ApplicationController

    def search
        if params[:stock].present?
        @stock = Stock.new_from_lookup(params[:stock])
            if @stock
                respond_to do |format|
                format.js {render partial: 'users/results'}
                end
            else
                flash[:danger] = "You have entered and invalid stock symbol"
                redirect_to my_portfolio_path
            end
        else
            flash[:danger] = "You have entered an empty search string"
            render "users/my_portfolio"
        end
    end

end