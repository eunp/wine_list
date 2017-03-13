class LocationsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])

    respond_to do |f|
      f.html
      f.js
    end
  end

  def edit
    @store = Store.find(params[:store_id])
    @location = @store.locations.find(params[:id])

    respond_to do |f|
      f.html
      f.js
    end
  end

  def create
    @store = Store.find(params[:store_id])
    @location = @store.locations.create(location_params)

    redirect_to store_path(@store)
  end

  def update
    @store = Store.find(params[:store_id])
    @location = @store.locations.find(params[:id])
    @location.update(location_params)

    redirect_to store_path(@store)
  end

  def destroy
    @store = Store.find(params[:store_id])
    @location = @store.locations.find(params[:id])
    @location.destroy

    redirect_to store_path(@store)
  end

  private
    def location_params
      params.require(:location).permit(:position, :description)
    end
end
