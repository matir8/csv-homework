require 'csv'
require 'linefit'
require 'English'

class LinRegressionsController < ApplicationController
  def create
    lineFit = LineFit.new
    file = params[:file]
    x_arr = []
    y_arr = []

    CSV.foreach(file.path) do |row|
      x_arr.push $INPUT_LINE_NUMBER
      y_arr.push row[0].to_f
    end

    lineFit.setData(x_arr, y_arr)
    intercept, slope = lineFit.coefficients

    render plain: '%.6f,%.6f' % [slope, intercept]
  end
end
