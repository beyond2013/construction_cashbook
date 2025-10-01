class ContractorsController < ApplicationController
  before_action :set_contractor, only: %i[ show edit update destroy ]

  # GET /contractors or /contractors.json
  def index
    @contractors = Contractor.all
  end

  # GET /contractors/1 or /contractors/1.json
  def show
  end

  # GET /contractors/new
  def new
    @contractor = Contractor.new
  end

  # GET /contractors/1/edit
  def edit
  end

  # POST /contractors or /contractors.json
  def create
    @contractor = Contractor.new(contractor_params)

    respond_to do |format|
      if @contractor.save
        format.html { redirect_to @contractor, notice: "Contractor was successfully created." }
        format.json { render :show, status: :created, location: @contractor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractors/1 or /contractors/1.json
  def update
    respond_to do |format|
      if @contractor.update(contractor_params)
        format.html { redirect_to @contractor, notice: "Contractor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @contractor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractors/1 or /contractors/1.json
  def destroy
    @contractor.destroy!

    respond_to do |format|
      format.html { redirect_to contractors_path, notice: "Contractor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractor
      @contractor = Contractor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contractor_params
      params.expect(contractor: [ :name, :contractor_type, :specialization, :phone, :email, :account_id ])
    end
end
