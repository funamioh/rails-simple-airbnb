class FlatsController < ApplicationController
  before_action :set_flat, only: %i[ show edit update destroy ]
  # get /flats
  def index
    @flats = Flat.all
  end

  # get /flats/:id
  def show
  end

  # get /flats/new
  def new
    @flat = Flat.new
  end

  def edit
  end

  # post /flats
  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: "flat was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # patch /flats/:id
  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: "Flat was successfully updated!"
    else
      render :edit, status: :unproccessable_entity
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :number_of_guests, :price_per_night)
  end
end
