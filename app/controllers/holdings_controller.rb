class HoldingsController < ApplicationController
  before_action :set_holdings

  def create 
    # Create new holding
    holding = Holding.new(holding_params)
    if holding.save 
      holding.user_id = @current_user.id
      render json: {
        status: :created,
        message: 'Holding created'
      }
    else
      render json: {
        status: :unprocessable_entity,
        error: 'Oops, something went wrong.'
      }
    end
  end

  def destroy 
    # Delete existing holding
  end

  def all_holdings
    # Logic for displaying all of a users holdings
    # holdings = Holding.where(user_id: @current_user.id)
    render json: {
      allHoldings: @holdings
    }
  end

  def top_holdings
    # Logic for providing a users top 5 holdings for dashboard
  end

  def stock_holding
    # Logic for data on all individual stock holdings and total holdings for individual stock
    holding = @holdings.where(ticker: params[:ticker])
    render json: {
      stockHoldings: holding
    }
  end

  def top_markets
    # Logic for providing data on a users top geographical markets
  end

  def top_sectors
    # Logic for providing data on a users top sectors
  end

  private

  def set_holdings 
    @holdings = Holding.where(user_id: @current_user.id)
  end

  def holding_params 
    params.require(:holding).permit(:name, :ticker, :units, :price, :date, :user_id)
  end
end