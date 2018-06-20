require 'csv'
class BetsController < ApplicationController
  
  def get_bets
    arr_of_arrs = CSV.read(Rails.root + "data.csv")
    @filtered_arrays = arr_of_arrs.select { |array| array[3].match? (params[:date]) }
    render 'bets.html.erb'
  end


  private

  def strong_params
    params.permit(:date)
  end
end