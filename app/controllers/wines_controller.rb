class WinesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    if sort_column && sort_column.eql?("store")
      @wines = Wine.all.includes(:store).order("stores.name #{sort_direction}")
    elsif sort_column && sort_column.eql?("location")
      @wines = Wine.all.includes(:location).order("locations.position #{sort_direction}")
    else 
      @wines = Wine.all
      if sort_column && %w[year size price].include?(sort_column)
        @wines.order!("#{sort_column} #{sort_direction}")
      else
        @wines.order!("LOWER(#{sort_column}) #{sort_direction}")
      end
    end
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def edit
    @wine = Wine.find(params[:id])
    @locations = Location.all
  end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to @wine
    else
      render 'new'
    end
  end

  def update
    @wine = Wine.find(params[:id])

    if @wine.update(wine_params)
      redirect_to @wine
    else
      render 'edit'
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy

    redirect_to wines_path
  end

  private
    def wine_params
      params.require(:wine).permit(:name, :vineyard, :region, :category, :year, :price, :note, :size, :location_id)
    end  

    def sortable_columns
      %(name vineyard region category year size price note store location)
    end

    def sort_column
      params[:column] && sortable_columns.include?(params[:column]) ? params[:column] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
