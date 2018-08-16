class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # GET /doses
  # GET /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  # GET /doses/1.json
  def show
  end

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @dose, notice: 'Dose was successfully updated.' }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
