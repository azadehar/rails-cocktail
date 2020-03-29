class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_doses_path(@dose.cocktail)
    else
      @dose = Dose.new
      render 'new'
    end
  end

  def destroy
   @dose = Dose.find(params[:id])
   @dose.destroy
   redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id)
  end
end
