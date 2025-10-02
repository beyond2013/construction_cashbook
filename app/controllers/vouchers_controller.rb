class VouchersController < ApplicationController
  before_action :set_voucher, only: %i[ show edit update destroy ]

  # GET /vouchers or /vouchers.json
  def index
    @vouchers = Voucher.all
  end

  # GET /vouchers/1 or /vouchers/1.json
  def show
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
    # build a few empty entries so form  shows inputs
    3.times { @voucher.voucher_entries.build }
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers or /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to @voucher, notice: "Voucher was successfully created." }
        format.json { render :show, status: :created, location: @voucher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1 or /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to @voucher, notice: "Voucher was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1 or /vouchers/1.json
  def destroy
    @voucher.destroy!

    respond_to do |format|
      format.html { redirect_to vouchers_path, notice: "Voucher was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def voucher_params
      params.expect(voucher: [ :date, :voucher_number, :voucher_type, :description, :project_id,
      voucher_details_attributes: [ :id, account_id, :debit, :credit, :_destroy] ])
    end
end
