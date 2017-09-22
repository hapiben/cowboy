class MilksController < ApplicationController
  before_action :set_milk, only: [:show, :edit, :update, :destroy]

  # GET /milks
  # GET /milks.json
  def index
    @milks = Milk.all
  end

  # GET /milks/1
  # GET /milks/1.json
  def show
  end

  # GET /milks/new
  def new
    @milk = Milk.new
  end

  # GET /milks/1/edit
  def edit
  end

  # POST /milks
  # POST /milks.json
  def create
    @milk = Milk.new(milk_params)

    respond_to do |format|
      if @milk.save
        format.html { redirect_to @milk, notice: 'Milk was successfully created.' }
        format.json { render :show, status: :created, location: @milk }
      else
        format.html { render :new }
        format.json { render json: @milk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milks/1
  # PATCH/PUT /milks/1.json
  def update
    respond_to do |format|
      if @milk.update(milk_params)
        format.html { redirect_to @milk, notice: 'Milk was successfully updated.' }
        format.json { render :show, status: :ok, location: @milk }
      else
        format.html { render :edit }
        format.json { render json: @milk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milks/1
  # DELETE /milks/1.json
  def destroy
    @milk.destroy
    respond_to do |format|
      format.html { redirect_to milks_url, notice: 'Milk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milk
      @milk = Milk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milk_params
      params.require(:milk).permit(:name)
    end
end
