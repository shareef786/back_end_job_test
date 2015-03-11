class ConvertersController < ApplicationController
  require "ext/string"
  require "ext/integer"
  respond_to :json

  # api/converters.html
  # api/converters.json
  def index
    if params[:roman]
      @roman = params[:roman].to_arabic.to_roman
      @integer = params[:roman].to_arabic
      r_data = {roman: @roman, integer: @integer}
    elsif params[:temperature_c]

    elsif params[:temperature_f]

    end

    respond_with r_data
  end
end
