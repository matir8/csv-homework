require 'csv'

class SumsController < ApplicationController
  def create
    file = params[:file]
    sum = 0
    CSV.foreach(file.path) do |row|
      sum += row[0].to_f()
    end
    sum.ceil
    render plain: '%.2f' % sum
  end
end
