class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :edit, :update, :destroy]

  # GET /receipts
  # GET /receipts.json
  def index
    # @user = current_user
    @user = current_user
    @receipts = @user.receipts
  end

  # GET /receipts/1
  # GET /receipts/1.json
  def show
    @user = current_user
    @receipts = @user.receipts.find(params[:id])
  end

  # GET /receipts/new
  def new
    @user = current_user
    @receipt = @user.receipts.new
  end

  # GET /receipts/1/edit
  def edit
    @receipt = Receipt.find(params[:id])
end

  # POST /receipts
  # POST /receipts.json
  def create
    @receipt = current_user.receipts.build(receipt_params)

  if @receipt.save
      redirect_to receipts_url, notice: "Receipt was saved successfully."
    else
      render :new
  end
  end


  # PATCH/PUT /receipts/1
  # PATCH/PUT /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to @receipt, notice: 'Receipt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1
  # DELETE /receipts/1.json
  def destroy
    @receipt.destroy
    respond_to do |format|
      format.html { redirect_to receipts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receipt_params
      params.require(:receipt).permit(:date_of_transaction, :image)
    end
  end

