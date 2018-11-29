class BarcodesController < ApplicationController
  before_action :set_barcode, only: [:show]

  def new
    @barcode = Barcode.new uid: Barcode.gen_uniq_uid
  end

  def create
    @barcode = Barcode.new(barcode_params)

    if @barcode.save
      flash[:success] = "Barcode was successfully created."
      redirect_to @barcode
    else
      render :new
    end
  end

  def show
  end

  private

  def set_barcode
    @barcode = Barcode.find_by id: params[:id]

    unless @barcode
      flash[:danger] = "Barcode was not found."
      redirect_to root_url
    end
  end

  def barcode_params
    params.require(:barcode).permit(:uid, :symbology, :outputter)
  end
end
