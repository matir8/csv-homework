require 'csv'
require 'linear-regression/linear'

class LinRegressionsController < ApplicationController
  def create
    file = params[:file]
    x_arr = []
    y_arr = []

    CSV.foreach(file.path).with_index(1) do |row, index|
      x_arr.push index
      y_arr.push row[1].to_f
    end

    result = Regression::Linear.new x_arr, y_arr

    render plain: '%.6f,%.6f' % [result.slope, result.intercept]
  end
end
