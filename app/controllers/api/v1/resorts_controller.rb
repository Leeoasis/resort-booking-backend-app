class Api::V1::ResortsController < ApplicationController
  before_action :set_resort, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token, raise: false

  def index
    @resorts = Resort.all
    render json: @resorts
  end

  def show
    @resort = Resort.find(params[:id])
    render json: @resort
  end

  def create
    @resort = Resort.new(resort_params)
    if @resort.save
      render json: @resort, status: :created
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  def update
    if @resort.update(resort_params)
      render json: @resort
    else
      render json: @resort.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resort.destroy
    head :no_content
  end

  private

  def set_resort
    @resort = Resort.find(params[:id])
  end

  def resort_params
    params.require(:resort).permit(:user_id, :name, :address, :description, :phone_number, :email, :city, :country,
                                   :available_rooms, :max_occupancy, :base_price, :image_url)
  end
end
