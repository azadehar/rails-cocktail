class IngredientsController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.cocktail = @cocktail
    if @ingredient.save
      redirect_to cocktail_path(@cocktail)
    else
      @dose = Dose.new
      render "cocktails/show"
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
