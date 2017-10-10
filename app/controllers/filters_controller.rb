require 'csv'

class FiltersController < ApplicationController
  def create
    file = params[:file]
    sum = 0
    CSV.foreach(file.path) do |row|
      if row[2].to_i.odd?
        sum += row[1].to_f()
      end
    end
    sum.ceil
    render plain: '%.2f' % sum
  end
end
