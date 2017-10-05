class NumberConverterController < ApplicationController
  def index
    safe_params = params.permit(:number, :base)
    @number_conversion = NumberConversion.new(safe_params)
    @number_conversion.save

    @past_conversions = NumberConversion.all
  end
end
