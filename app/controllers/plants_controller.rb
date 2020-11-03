class PlantsController < ApplicationController
  before_action :find_garden, only: [:new, :create]

  def new
    @plant = Plant.new
  end

  def create
    # 1. get the garden

    # 2. create a new plant filled with data from the form
    @plant = Plant.new(plant_params)

    # 3. assign the garden to the plant
    @plant.garden = @garden

    # 4. save or render tge form if not valid
    if @plant.save
      redirect_to @garden
    else
      render :new
    end
  end


  def destroy
    # 1. get the plant
    @plant = Plant.find(params[:id])

    # 2. destroy the plant
    @plant.destroy

    redirect_to @plant.garden
  end

  private

  def find_garden
    @garden = Garden.find(params[:garden_id])
  end

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
