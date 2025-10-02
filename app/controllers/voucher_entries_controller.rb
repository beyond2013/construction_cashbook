class VoucherEntriesController < ApplicationController
  before_action :set_voucher_entry, only: %i[ show edit update destroy ]

  # GET /voucher_entries or /voucher_entries.json
  def index
    @voucher_entries = VoucherEntry.all
  end

  # GET /voucher_entries/1 or /voucher_entries/1.json
  def show
  end

  # GET /voucher_entries/new
  def new
    @voucher_entry = VoucherEntry.new
  end

  # GET /voucher_entries/1/edit
  def edit
  end

  # POST /voucher_entries or /voucher_entries.json
  def create
    @voucher_entry = VoucherEntry.new(voucher_entry_params)

    respond_to do |format|
      if @voucher_entry.save
        format.html { redirect_to @voucher_entry, notice: "Voucher entry was successfully created." }
        format.json { render :show, status: :created, location: @voucher_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voucher_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voucher_entries/1 or /voucher_entries/1.json
  def update
    respond_to do |format|
      if @voucher_entry.update(voucher_entry_params)
        format.html { redirect_to @voucher_entry, notice: "Voucher entry was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @voucher_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voucher_entries/1 or /voucher_entries/1.json
  def destroy
    @voucher_entry.destroy!

    respond_to do |format|
      format.html { redirect_to voucher_entries_path, notice: "Voucher entry was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher_entry
      @voucher_entry = VoucherEntry.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def voucher_entry_params
      params.expect(voucher_entry: [ :voucher_id, :account_id, :debit, :credit, :narration ])
    end
end
