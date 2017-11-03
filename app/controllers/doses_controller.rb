class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def show

  end

  def create
    # if we want to check if our code is reaching here from a form, we can put a buybug
    # once here with the buy bug, we know that the form is routed correctly
    # once that is correct we can test our variable to: check whats inside, check format, check if all data

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
   params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
 end
end
