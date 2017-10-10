require 'csv'
require 'enumerator'

class IntervalsController < ApplicationController
  def create
    file = params[:file]
    max_sum = 0
    nums = []
    CSV.foreach(file.path) do |row|
      nums.push(row[0].to_f)
    end

    nums = nums.to_enum
    nums.each_cons(30) do |interval|
      curr_sum = interval.inject(0) { |sum, x| sum + x }
      max_sum = curr_sum if curr_sum > max_sum
    end

    max_sum = max_sum.ceil
    render plain: '%.2f' % max_sum
  end
end
