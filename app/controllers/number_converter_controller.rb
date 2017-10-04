class NumberConverterController < ApplicationController
  def index
    safe_params = params.permit(:number, :base)
    # If we are submitted the form
    if !safe_params.empty?
      @number = safe_params[:number].to_i
      @base = safe_params[:base].to_i
    end
  end
end
