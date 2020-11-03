class GardensController < ApplicationController
  before_action :set_garden, only: :show

  def index
    @gardens = Garden.all
  end


  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = Garden.find(params[:id])
    end
end
