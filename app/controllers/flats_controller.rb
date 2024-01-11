class FlatsController < ApplicationController
  def index
    @flat = Flat.all
  end
end
