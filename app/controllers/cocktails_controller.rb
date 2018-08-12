class CocktailsController < ApplicationController
  def index
    if params[:q] && !(params[:q] == "")
      @cocktails = Cocktail.joins(doses: :ingredient).where("ingredients.name ILIKE '#{params[:q]}%'")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
